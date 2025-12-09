Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 486B6261388
	for <loongarch@lists.linux.dev>; Tue,  9 Dec 2025 10:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765277810; cv=none; b=MqKzRCBM4gtgs6qTxjBQjAnNWa5Kg8KNPVlZ+EgoiNyllKknZc/YB35GZmoOtBtK2Nx1bC9GiqCPt5T9n4F8+DWr57YnZKVDee8TgPGcDFeY3fbl82cykhLpY6cGVZ+JfFaFt3qZkft2K/gTHQVz5Cn3nDinT4QLx8nmxNWlcXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765277810; c=relaxed/simple;
	bh=asy34GF/k7rwU26Lp+ifZwgVFrPkNZdWmRI8UBGyztE=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=p155SCd0+J0NThLfDNHLXb4lhVfeQMcQGMn+2FteEHzcocZRcWHx0sXkVoC9ep0Um159/8fkiqLjfz0dbrqv5TqBa0O7no1L10cU93yNS1PORzIE5mD3k5NQpbEyjIZsBOmshPnwbiUcYlwZnIjpzix0mCA9MTXousmmukRw86E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gv2j0CZ6; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gv2j0CZ6"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-297f5278e5cso9346385ad.3
        for <loongarch@lists.linux.dev>; Tue, 09 Dec 2025 02:56:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765277808; x=1765882608; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Bwdcr6J6JkQ5MN9u9veUQ8APZTuYdOs+09yDTwCve4c=;
        b=Gv2j0CZ6IDsPa9vAnvVz6wHA06uA9Qtj3ALBd7MGjx99dKmAQuvIuBNzehSdvjJZu3
         TzDTgqIj4MJMc9oXDr6taYyLB+rBrGnKiqGHp4QT5yX0yShlYJt1/xexqdfRZEF0gKGW
         5rX7tLK2zJIUzzKi33u6yV48EN1EhD3WoMVD5YYb3xunB78zxD/RZHSP+tUykYxdk5RQ
         rNgS1WVBBCcNtEjlf3rIGbRr5z+YtcCUJBWrfMYNiYd8YMQqtx++LQ1PWTow+bR+1TD0
         OUtYj3ENQj43tZlf7sGtFve/yqahAL7aJ0Cq/PJhEAGW8Q6PAk9jQY0e5Co4MqGfVRp5
         12Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765277808; x=1765882608;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Bwdcr6J6JkQ5MN9u9veUQ8APZTuYdOs+09yDTwCve4c=;
        b=OWMXqIC0ROdaVNaEgRja2Q34MozLdbiQkDHNrJwiTgCVdnP8w7FVcUNcJv+v9S8/sN
         /9L/NX3l6s8UCuwAzy9wfcDh+R1C9oMtkYCiLpucjJf4F79Msg6e6bkfZnfZYiYnfAxZ
         nOgOxLFDw4KiT41/6PWJrKeu9A9RVtuI96CTWkhAUBv/ti3mufvRMuZ04jnP+nmAIUEf
         dudIyI2owhh/RJfHJnIFlubwkK4GV+AjO1Dxx1FnC1iyzq6UmhbTvuDjCxgKTbHibjXf
         WcSv8bj4AhdUM31Ard0aUY6x+WVNGT+cdNOJRHXcJL4l2RZqbKAsmt6OJMKfL4aBCuFY
         2wpg==
X-Forwarded-Encrypted: i=1; AJvYcCUXFJqzsK6kAx4wnxHXilq9F9oHPNTrI3327ag3UYueWi6UnvDAUcTecmMMesE7TlD5T6hZyIqob5Q=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyd8pJK6YyG2It5WB27AKsawNsmMYVfsMsOXYGasLRDTakhtZGJ
	9NSgl0XeDBzny0H6mp/xmfMdLsa9+jQVa+UqBqYDPLJAE5/G1kYhb2hkKLVuAFwG7rA2TwNj416
	J3LXrrx8Wc0z9qg4vKZ90nGGJjRvD4q0=
X-Gm-Gg: ASbGnct/lLobJWBYJGUr8uXwrpncq6nc7gEjHC6Pk15woMnyzvYl4EGkO5NOzHN22fB
	U7Dt0ZsefFmefoGFlKq+4AmlEwGzNdA1tVCLvHwlHPFM8FUo9anBoIC1C8TdITL3N6nNA8AIC4H
	0dD1zMfVORrKB3DBThFkzYi8fKriaW6ZvNHdI+LO5ZNZNIRuhCXsfrjWDgwHxxq3So9ybKxf2Tq
	/CB6/kbKTkHap+AjZ6Eq17shW/TCHJ8Rzy4MVBHdAIUy9GoZjQGkTLNi0QW/znS6DbniaFBu+b/
	qd9PH0v+kkIX3kOAv4TC1SV80fNimOjUj4m3OaPs5BxMV+7ZKzLvdi1A0v1cwnqEBS0Ojv+x7BJ
	T3KTABN9nggelGA==
X-Google-Smtp-Source: AGHT+IFvhi0cPvzSCKaZ1uKZHwQq5MrmhfsTuE4vvBZn212BPKoqThiqfNhiGSZoJvwzmV5G5qGINyy3cGPYIpxbNJ4=
X-Received: by 2002:a05:7300:d706:b0:2ab:ca55:89c9 with SMTP id
 5a478bee46e88-2abca559a26mr3005396eec.4.1765277808339; Tue, 09 Dec 2025
 02:56:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 9 Dec 2025 11:56:35 +0100
X-Gm-Features: AQt7F2onLl2G2SdnTe3M9zZMQUo29ueZ3enRDYXrYXm6UqTPRsCYNL8c_CkSU9k
Message-ID: <CANiq72mrVzqXnAV=Hy2XBOonLHA6YQgH-ckZoc_h0VBvTGK8rA@mail.gmail.com>
Subject: Mainline loongarch64 defconfig+Rust build error
To: Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Alice Ryhl <aliceryhl@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	=?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <christian@brauner.io>, 
	Carlos Llamas <cmllamas@google.com>
Cc: =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Danilo Krummrich <dakr@kernel.org>, Benno Lossin <lossin@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, loongarch@lists.linux.dev, 
	rust-for-linux <rust-for-linux@vger.kernel.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi all,

I am seeing in mainline loongarch64 defconfig+Rust the following build
error [1].

Cheers,
Miguel

[1]

 error[E0425]: cannot find value `compat_ptr_ioctl` in crate `bindings`
     --> drivers/android/binder/rust_binder_main.rs:317:38
      |
317   |         compat_ioctl: Some(bindings::compat_ptr_ioctl),
      |                                      ^^^^^^^^^^^^^^^^ help: a
function with a similar name exists: `compat_sys_ioctl`
      |
     ::: /__w/quick/quick/linux/rust/bindings/bindings_generated.rs:78264:5
      |
78264 |     pub fn compat_sys_ioctl(fd: ffi::c_uint, cmd: ffi::c_uint,
arg: compat_ulong_t) -> ffi::c_long;
      |     ----------------------------------------------------------------------------------------------
similarly named function `compat_sys_ioctl` defined here
