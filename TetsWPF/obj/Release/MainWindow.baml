   M S B A M L   `   `   `  ���� B  >Chatter, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null!clr-namespace:TetsWPFTetsWPF      TetsWPF.MainWindow   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     @d2http://schemas.microsoft.com/expression/blend/2008     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     'localclr-namespace:TetsWPF       � Title$  Chatter��$��704.4��$��504.4��
������  � AllowsTransparency .  � WindowStyle$
 None=� � 	Resources    WindowColor  ContentAreaColorLight  SelectedBackgroundColor  SelectedUnfocusedColor  ControlLightColor  ControlMediumColor  ControlPressedColor  
GlyphColor  DisabledBorderLightColor 	 TextBoxTemplate �� 
TargetType �� CornerRadius ��Name �� 
TargetType �� Triggers	 P� Property
 P� Value �� Property �� Value �� Triggers :� RoutedEvent g� Duration �� TargetProperty	 W� To 
 CrossButton  
LineButton  TextBoxBase �� BasedOn  TextBoxEvented  ComboBoxToggleButton � ColumnDefinitions'  !System.Windows.VisualStateManager   VisualStateGroups%  System.Windows.VisualStateGroup   States   System.Windows.VisualState   
Storyboard �� 
TargetName8  2System.Windows.Media.Animation.EasingColorKeyFrame �� KeyTime �� Value ��Name �� EndPoint �� 
StartPoint  BorderLightColor � Color � Offset  BorderDarkColor �� Color  F�Name  ComboBoxTextBox! R� KeyTime  System.Windows.Visibility"   Visible# R� Value$   Hidden% d�Name& �� 	ClickMode' d� 	IsChecked( �� Mode) �� RelativeSource* ��Name+ J� IsHitTestVisible, �� SelectionBoxItem- �� SelectionBoxItemTemplate. ��Name/ �� 
IsReadOnly0 �� 
IsReadOnly1 �Name2 �� IsDropDownOpen3 � AllowsTransparency4 �Name5 J� SnapsToDevicePixels6 � ActualWidth7 �� MaxDropDownHeight8 K� IsItemsHost-  'System.Windows.Input.KeyboardNavigation9   DirectionalNavigation: �� 
TargetName; P� 
SourceName< �� Padding��%�  &	        &	      &	 &     &	 9     &	 L     &	 _     &	 r     &	 �     &	 �     &		 �     '�� '    &	
 i    &	 �    '�� �    &	 K    7��7 	 &	      7  &	 7    7   7  &	 �    '�� !    7  7  '�� �    7  7  ��	#FF080808����	#FFC5CBF9����	#FFC8C8C8����	#FFDDDDDD����	#99B9B9B9����	#4440444B����	#5540444B����	#CC888EFF����	#FFAAAAAA���� " ��.R��� $��Border��$ 5��$��1q�#��z��._��� $ PART_ContentHost������ " �� P� 	 �@J�IsMouseOver
 . . ���  � ��
 �������  �@�Cursor$ IBeam�� :� $ Mouse.MouseEnter��[��� .���� .��W� $ 0:0:0.2D�$ FontSize�$ 16X�:� $ Mouse.MouseLeave��[��� .���� .��W� $ 0:0:0.2D�$ FontSize�$ 15X��� " ��.���  � �� �� " ��.R��� $ 5��$��3q����	#FFBCBCBC#��z������ " �� P� 	 �@J�IsMouseOver
 . . ���  � �� �	#9936393F._��� #��z��#��z�� P� 	 �@J�IsMouseOver
 . . ���  � �� �	#FFCECECE��  � �� �	#CC888EFF��  � �� �	#99B9B9B9�� " ��.���  � �� �� " ��.R��� $ 50��$��3q����	#FFFF0000#��z������ " �� P� 	 �@J�IsMouseOver
 . . ���  � �� �	#FFFF0000._��� #��z��#��z�� P� 	 �@J�IsMouseOver
 . . ���  � �� �	#FFFF0000��  � �� �	#CC888EFF��  � �� �	#AAFF0000�� " ��.���  � �� �� " ��.R��� $ 50��$��3q����	#FFFFFF00#��z������ " �� P� 	 �@J�IsMouseOver
 . . ���  � �� �	#9936393F._��� #��z��#��z�� P� 	 �@J�IsMouseOver
 . . ���  � �� �	#FFFFFF00��  � �� �	#CC888EFF��  � �� �	#AAFFFF00�� " ��.���  � �� �� " ��.R��� #��z��#��z����  � �� �	#CC888EFF�� " ��8   .���  � �� �	#9940444B��  � ��$ 15(���  �@��AcceptsReturn . ��  � ��8  ��  � ��
 ����� P� 	 �@J�	IsFocused
 . . ���  � �� �	#FFC8C8C8�� 8   " ��.�-   �� " d�.R��  �� �� $��20 �   CommonStates��.   
Normal��  	MouseOver��. �� .���� $_ Y(Panel.Background).                 (GradientBrush.GradientStops)[1].(GradientStop.Color)�$ Border��.g�  $ 0��8     Pressed��  Disabled��. �� .���� $_ Y(Panel.Background).                 (GradientBrush.GradientStops)[1].(GradientStop.Color)�$ Border��.g�  $ 0��$ Black���� $; 5(Shape.Fill).                 (SolidColorBrush.Color)�$ Arrow���� $a [(Border.BorderBrush).                 (GradientBrush.GradientStops)[1].(GradientStop.Color)�$ Border��  CheckStates��.   Checked��. �� .���� $_ Y(Panel.Background).                 (GradientBrush.GradientStops)[1].(GradientStop.Color)�$ Border��.g�  $ 0��8    	Unchecked��  Indeterminate��.+��� $ Border��$��2��$ 2��$��1q����� $	 0,1&�$	 0,0&�.��� # �  $ 0Q�� # �  $ 1Q����� $	 0,0&�$	 0,1&���� � # �  � # �  $	 1.0Q��� $��0��$ 2,0,0,2��$��1q����� # �  F� $  Arrow��$��1��$��Center=�$��Center=�"����        � 	=  	= � z     	���� # �  �� " ��.R��� $ PART_ContentHost��|�.  #��z���� " ��.���  �@J�SnapsToDevicePixels . ��  �@�OverridesDefaultStyle . ��  � ��$
 Auto=���  � ��$
 Auto=���  � �� . ��  � ��$	 120����  � ��$ 20����  � �� �	#CC888EFF��  � �� �� " ��.R��    CommonStates��.   
Normal��  	MouseOver��  Disabled��. �� .���� $ PART_EditableTextBox��$M G(TextElement.Foreground).                       (SolidColorBrush.Color)�  
EditStates��.   Editable��. �� .��T� $ (UIElement.Visibility)�$ PART_EditableTextBox��..�i� $! 0��## Z" T� $ (UIElement.Visibility)�$ ContentSite��..�i� $! 0��## Z$   
Uneditable��.+�d� $% ToggleButton��8��  $��2��|�.  $& Press=�' �� *IsDropDownOpen+$( TwoWay=�) �� *TemplatedParent+�� $* ContentSite��+ .  #��z, #��z- #��z��$��3,3,23,3q�$��Stretch=�$
��Left=��� $. PART_EditableTextBox��8�� $
��Left=�$��Bottom=�$��3,3,23,3q�|�. 
������ $y�Hidden=�#0 z/ ��Z� � $1 Popup��$��Bottom=�#��z2 3 . |�.  $��Slide=�.��� $4 DropDown��5 . #��z6 #��z7 .+��� $ DropDownBorder��$��1q����� $ 	#FF50545B������ $ 	#FFCECECE���� $��4,6,4,6q�5 . .���� 8 . $9 	Contained=��� $ 5��$��3q����	#FFCECECE#��z������ " �� P� 	 �@J�IsMouseOver
 . . ���  � �� �	#FFCECECE P� 	 �@��HasItems
 .  . ��� $: DropDownBorder�� � ��$ 95��P� 	 �@��
IsGrouping
 . . ���  � �� .  P� $; Popup��	 �@�AllowsTransparency
 . . ��� $: DropDownBorder�� �@��CornerRadius$ 4���� $: DropDownBorder�� � ��$ 0,2,0,0q��� " ��.���  �@J�SnapsToDevicePixels . ��  �@�OverridesDefaultStyle . ��  � �� �� " ��.R��� $ Border��$< 2q�5 . 
������    SelectionStates��.   
Unselected��  Selected��. �� .���� $ Border��$E ?(Panel.Background).                     (SolidColorBrush.Color)�.g�  $ 0��8     SelectedUnfocused��. �� .���� $ Border��$E ?(Panel.Background).                     (SolidColorBrush.Color)�.g�  $ 0��8  ._��� .���� $ 	40,0,40,0��$��0q����	#FFC8C8C8._�� -   $��	InnerGrid��$��Stretch=�$��Stretch=�$��10,40,10,10q�.+��� $ 30��
�������$��	0,-6,0,-1q��� -   $��L1��
�������$F��@Разработчик: Пилецкий Дмитрий, PickAim��$
��Left=�$��20��$��236,624,0,0q�$	��Top=�$	��233���� -   $��L2��
�������$*��$Для связи: dima-pile@mail.ru��$
��Left=�$��20��$��236,635,0,-1q�$	��Top=�$	��233���� -   $��	ChanelUrl��$��Ссылка��$
��Left=�$��	10,62,0,0q�$	��Top=�= J� RenderTransformOrigin$= 2.469,-2.984&��� -   $��
UrlTextBox��#��[ $
��Left=�$��27��$��	10,82,0,0q�> �� TextWrapping$
> Wrap=�$!��https://t.me/chat_reference��$	��Top=�$	��267��
�������$��15(����	#3340444B�� -   $��GetDataButton��$!��Получит данные��$
��Left=�$��27��$��
296,82,0,0q�$	��Top=�$	��173���� -   $��	checkBox1��$	��2.5q�
�������
������ $m��gСчитывать только пользователей с указанными телефонами��$
��Left=�$��20��$��
10,114,0,0q�$	��Top=�$	��459���� -	   $��StatusLabel��$�� ��$
��Left=�$��25��$��
296,57,0,0q�$	��Top=�$	��173���� -
   $��DocLabel��$?��9Документ с базой пользователей��$
��Left=�$��
10,139,0,0q�$	��Top=�$= 2.469,-2.984&��� -   $��
DocTextBox��#��[ $
��Left=�$��15(�$��27��$��
10,164,0,0q�$
> Wrap=�$�� ��$	��Top=�$	��267�����	#3340444B�� -   $��
FileButton��$��Обзор...��$
��Left=�$��27��$��296,164,0,0q�$	��Top=�$	��173���� -   $��Message��$��Сообщение:��$
��Left=�$��
10,196,0,0q�$	��Top=�$= 2.469,-2.984&��� -   $��MessageTextBox��#��[ $
��Left=�$	��175��$��
10,217,0,0q�$	��Top=�$	��459�����	#3340444B�� -   $��
ImageLabel��$��Изображение��$
��Left=�$��
10,407,0,0q�$	��Top=�$= 2.469,-2.984&��� -   $��ImageTextBox��#��[ $
��Left=�$��15(�$��27��$��
10,428,0,0q�$
> Wrap=�$�� ��$	��Top=�$	��267�����	#3340444B�� -   $��ImButton��$��Обзор...��$
��Left=�$��27��$��296,428,0,0q�$	��Top=�$	��173���� -   $��VidLabel��$��Видеозапись��$
��Left=�$��
10,469,0,0q�$	��Top=�$= 2.469,-2.984&��� -   $��
VidTextBox��#��[ $
��Left=�$��15(�$��27��$��
10,490,0,0q�$
> Wrap=�$�� ��$	��Top=�$	��267�����	#3340444B�� -   $��	VidButton��$��Обзор...��$
��Left=�$��27��$��296,490,0,0q�$	��Top=�$	��173���� -   $��
ErrorLabel��$�� ��$
��Left=�$��
10,554,0,0q�$	��Top=�$	��459��$��9(��� -   $��
SendButton��$��Отправить��$
��Left=�$��22��$��
10,532,0,0q�$	��Top=�$	��459��� -   $��ToolBar�����	#FFC8C8C8$��Stretch=�$��24��$��34,-40,98,0q�$	��Top=�� $
��Left=�$��29��$��409,-40,0,0q�$	��Top=�$��75��$= 0.183,0.411&�.+��� -   $��CloseButton��#��[
 $
��Left=�$��22��$��35,4,0,0q�$	��Top=�$��24��.���� $-��'pack://application:,,,/Images/cross.png���� -   $��MinimizeButton��#��[ $
��Left=�$��22��$��9,4,0,0q�$	��Top=�$��23��.���� $,��&pack://application:,,,/Images/line.png���� $,��&pack://application:,,,/Images/logo.png��$��	5,4,5,596q��� -   $
��BAIm��$*��$pack://application:,,,/Images/BA.png��$��12,566,12,19q��� -   $��SendTypeComboBox��$
��Left=�$��25��$��296,134,0,0q�$	��Top=�$	��173��.@��� ? �� 
IsSelected? . .��
Telegram�� .��
WhatsApp