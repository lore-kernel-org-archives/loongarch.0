Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9194283FC9
	for <loongarch@lists.linux.dev>; Thu, 11 Dec 2025 01:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765416370; cv=none; b=P+SaGTfQwQi9vPMy5MNBL0eEVPBD+rlTqYCGBLXFh3Xqc7c6OeBcrK3vqKXkxDmgs+KN8Zw0p7Tn9H2HnCdEpWPY/nAezQTz+2WrsAaekxR/wIOopRc7YwkhOCuT3RCjYJhabMQNokC1vS3lGQDpEdUHcU3jmH+ZvX8gW9u/Ido=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765416370; c=relaxed/simple;
	bh=fkIU38+DrR3AdoeQ0P5x44vvFvvxY/Cefi42fu4JTfI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=j4eVAIMcWcH17E/BG86TK0l3Lbog7r7XfwD6T2Cv321mkHTLwwgGUqnGxBU3u1lhtSQGVaigPBxttjL9BDXx9HwisTl5L6O35Kp88G136k8Qo91xef8QR2Cmbh5G+2hT/K7D/qmEEFi8p8U9oJPWbzjpwRrkqt7VCCgizEx7ldQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=2l6rqx80; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2l6rqx80"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-477cf2230c8so2536945e9.0
        for <loongarch@lists.linux.dev>; Wed, 10 Dec 2025 17:26:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765416367; x=1766021167; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Y4KiDnrQtQVQJ8eu5sE0xs2xE6UVbNpY7d6oBg5X4Nc=;
        b=2l6rqx803M/5IpLW6R3M/goCatysnmdso78vc7buJ0lBs6CeNRA4zk2PQNSUyxKNdx
         y8PDGQC97N1TYtmfikQDxJNDoVJaTldFgh3iPKSVM8qq0NTwpRrZY94H0aW/4ZVhFblr
         GjDPKI9r5EBpSrI5cvGkl2ZTfHB8FtxxjG1mvTaI6EYYTQrzNyL6rci6QqIoBA4BElWT
         dxJX1Ge+s+x4GyGryLlzU/iO1D2lHfq9LLsTjJn6JA/3DczGs98dnfOVvX4MAjl+uVed
         NFSnCrkaSR1g+HGbp/CST3vyH1C4aoF7Bjm2d/HC2mSs7+0ZJ00Z33L8aFxaoGs3GdML
         pJnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765416367; x=1766021167;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y4KiDnrQtQVQJ8eu5sE0xs2xE6UVbNpY7d6oBg5X4Nc=;
        b=uiAt2+xdW/P7yRWMTvLMERN7YK5TAElbhz41J76H/RCuU705cgk/rTXaqPvpJkkv6b
         S1cwNp4U5c+6/ljZVAD52EmZkjq4fP9RwOaykwoL8Xf9yNcZtrW9d6E9KYchTm2tQ6hX
         vzLq8vJQVreCvZaxxYB77LfagS1tfwmcXE9OSaoMNUjdbXYD2cg/McPrgiva7VHn4COy
         BNVcJEwJvRmw1ph7wwbEgcvv+ll5ObLJKMJ4yQJ/SwcvecHH95U/DuOUU7RZ4Sop0MR2
         hNVXU8E05GyRfhNl7qPKkXzaJvqN1T8E9w09DaViRT7HKS6i2F8gDDiVJ2IY8MoqDvNZ
         J0Kg==
X-Forwarded-Encrypted: i=1; AJvYcCWaBbz4CY6xhAPIW9hEX3qk7tYZspoX53sue99PEtmccvT//b5NbY1HGZPi3O/MbgH/iwmdcuMV8TQ=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz0dWx4Q0jweHvhP7EpYRz8qjj5eiy7KpquRQq8tU12UwKDpYEb
	cCeiy0Yf1q+G/5D3jTbbThkeRpF9ljVCg1Trps8xY0LXM0LRyDVzuVf6EmyrXZgIC+AXdi+SqDb
	3siL5auTCnHW8bjhGUg==
X-Google-Smtp-Source: AGHT+IHBasYlnGxpOIwRHX92I/SAKHIZ5gppj6j0ZTPmxxHS+/VA0qY5cuzl4EMGaGmPCgxYW2i2O5kk3zlaYX4=
X-Received: from wmbdx18.prod.google.com ([2002:a05:600c:63d2:b0:477:a0e9:dc85])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3106:b0:476:84e9:b571 with SMTP id 5b1f17b1804b1-47a8380c5aemr35666215e9.14.1765416367088;
 Wed, 10 Dec 2025 17:26:07 -0800 (PST)
Date: Thu, 11 Dec 2025 01:26:06 +0000
In-Reply-To: <20251209125029.1117897-1-xry111@xry111.site>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20251209125029.1117897-1-xry111@xry111.site>
Message-ID: <aTodrqABDzBQXUXD@google.com>
Subject: Re: [PATCH] rust_binder: Fix build failure if !CONFIG_COMPAT
From: Alice Ryhl <aliceryhl@google.com>
To: Xi Ruoyao <xry111@xry111.site>
Cc: Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Mingcong Bai <jeffbai@aosc.io>, loongarch@lists.linux.dev, hev <r@hev.cc>, 
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Arve =?utf-8?B?SGrDuG5uZXbDpWc=?=" <arve@android.com>, Todd Kjos <tkjos@android.com>, 
	Christian Brauner <brauner@kernel.org>, Carlos Llamas <cmllamas@google.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, 
	"open list:ANDROID DRIVERS" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"

On Tue, Dec 09, 2025 at 08:50:19PM +0800, Xi Ruoyao wrote:
> The bindgen utility cannot handle "#define compat_ptr_ioctl NULL" in the
> C header, so we need to handle this case on our own.
> 
> Simply skip this field in the initializer when !CONFIG_COMPAT as the
> SAFETY comment above this initializer implies this is allowed.
> 
> Reported-by: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
> Closes: https://lore.kernel.org/all/CANiq72mrVzqXnAV=Hy2XBOonLHA6YQgH-ckZoc_h0VBvTGK8rA@mail.gmail.com/
> Signed-off-by: Xi Ruoyao <xry111@xry111.site>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

Thanks!
