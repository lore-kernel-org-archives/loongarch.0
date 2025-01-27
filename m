Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2060018E756
	for <loongarch@lists.linux.dev>; Mon, 27 Jan 2025 20:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738011345; cv=none; b=jPpwfLk4iDTt6nLQ0i+5N7f8EEjG+ENk/MJJmyv5furfRXqQ7qfjYUyAn1UEgrNwHPI5hSuYdlyb8JKKoSEDor67elq2MAeISbJrb3bY8xLTanpib0owTI9RcbWizZaWkbPkgs55P/YbmYOU1iLwnbOORnvDZ+VZRubRUP3mbiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738011345; c=relaxed/simple;
	bh=jfTRFCA1KmS9TpTqFPy8CeZwxhz7yxFiLix/Mo9F++I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TeX4sxtE4S8HTG713Z7zH8nOWVew5xuC44Q1F1V+DnFE1yxB+biVpZrHhr1WgMbrZpMgXBb/1xy9cJaVbuyLeI3Pz8IPWIDthXozmSIDbpAzJimcvuiRRciCjdqijpDI3MRUYkzz+ixOS1nccVzxheFCGgFlgq+1dRUFSXMpVEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=fHF+FWL7; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="fHF+FWL7"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-21bc1512a63so94857065ad.1
        for <loongarch@lists.linux.dev>; Mon, 27 Jan 2025 12:55:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738011343; x=1738616143; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pVHaUGwMILzwQkxTtmzPwlrQrsAV/yWdWfyIAOu7hxk=;
        b=fHF+FWL7wPgRNZARP77JRQoLaay9nHvkahsByr8ThwlZFUQGbLPFvcQM+AwdX2roFZ
         GBL2UXgXfEXU+lwo8zyx3MS/9TOsoH709/MahSzDL+coOlDS5QgXuJ6cpmRKj33GDac9
         18VWQde7ky1cKCJVmvamASIOF8vcNIcfGEhLuNRmRy+hypYPXucGIGN4oeBvTdiOCBBq
         D/IYZ8T9OEnYbgHdBaS+pRbcya/kbUW83F7qa9RfhF3ehdEJpGAWHzAamxMBEkesZgcX
         5B5174VFgZOPsxrh6k/f/gEUVCJGjttxZvmCea0k/Ei6I9Zmq4J9racaGnaM8cr0RWUI
         euRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738011343; x=1738616143;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pVHaUGwMILzwQkxTtmzPwlrQrsAV/yWdWfyIAOu7hxk=;
        b=ALnOf7HfsUJHrN7Af/LyA036yOUcbhEm3cMxGqtshFkchX5635VBxE/OCH7B4BGr+B
         N6YVpJVSsSyhPSCTF/ipbxwWZUdedmrDvwVhpcqlcLAwXr9qlW8zjxilcZETD0r+sJOT
         YcrdEsgu8inMbAo1zuZaPVh8yQM6+9R6yjuQxmi2s6Xpu2mkM3qfZNl5nv2f95OzJ4DY
         LIeDcC42QrLR8/1TZU+RMNj4AAUGaTu0PYx3LSiIKEfdSGFk+mGEa+kI7v7tWWUzVHao
         FJ7af6XZ72n+x4aE39nnEGin+pi3SXZ7GAnQbUrZWLOGmRremqQtEo6P5avsz9mkVZeH
         G6dA==
X-Forwarded-Encrypted: i=1; AJvYcCVwqc+O+1b3SsVMT3+7gGdgGF+GZfGQIVzoVRnsnCGlwoISLTyUrAUpns8/0l4rLALDL2Z09SJxLOQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YwrLf3CfH0khRsUZo5CkXWgqqDP0o0bM5U5qJA2TF7DXrzXe+yA
	VcB9zwAVcC03dLGgvmQCcGIYd1kqUzqGG8SHje+7/Nd7GziYI2mSAWWVCfvJa+k=
X-Gm-Gg: ASbGncsQWA9xbtsv6y8ILEk3vai755bzDm/EzQye2aobGr5B5+g4h6/pv0U4n44lXLd
	VpKTQw9k3A7iEqTK9yBxxlVKxjrhRt7mhGiFZPOYPneLFblHUh8CpnUpiXHV4goUCjeJW+44F3D
	F+YAhTTwbLnomHoeT2cT8Ja6U3k1ZhsQQZk57TIjSdqgT+J44OkywWz0ngzAFTIGunlCvwSjudt
	i8bpGEdosXKdKYp/+LaYhViY15CssxmXCIDR5VTOIeFlFm94vV0/1LqoU1JmR7nY93FVYU=
X-Google-Smtp-Source: AGHT+IE1NMyz0iI/G4TK23r8ZOaRjDxxIJWPoHoMwhYOSqFyTwcsoQRJGo4yrKOrcu8plwruiOiHIQ==
X-Received: by 2002:a17:902:ea11:b0:215:b5d6:5fa8 with SMTP id d9443c01a7336-21c355c84a9mr625758965ad.22.1738011343332;
        Mon, 27 Jan 2025 12:55:43 -0800 (PST)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21da424f39fsm67418145ad.249.2025.01.27.12.55.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 12:55:42 -0800 (PST)
Date: Mon, 27 Jan 2025 12:55:40 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Andy Lutomirski <luto@kernel.org>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev
Subject: Re: [PATCH 1/4] riscv: entry: Convert ret_from_fork() to C
Message-ID: <Z5fyzMjj_5gqOupB@ghost>
References: <20250122-riscv_optimize_entry-v1-0-4ee95559cfd0@rivosinc.com>
 <20250122-riscv_optimize_entry-v1-1-4ee95559cfd0@rivosinc.com>
 <alpine.DEB.2.21.2501252313210.27203@angie.orcam.me.uk>
 <Z5aSMVZLMwmyCp9k@ghost>
 <alpine.DEB.2.21.2501272017140.56843@angie.orcam.me.uk>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2501272017140.56843@angie.orcam.me.uk>

On Mon, Jan 27, 2025 at 08:20:56PM +0000, Maciej W. Rozycki wrote:
> On Sun, 26 Jan 2025, Charlie Jenkins wrote:
> 
> > >  Wouldn't it make sense to save a jump here and make it a tail call, i.e.:
> > > 
> > > 	la ra, ret_from_exception
> > > 	tail ret_from_fork
> > > 
> > 
> > I don't believe so due to the return address stack. It was shown in this
> > patch [1] that a 7% performance improvement can be seen on existing
> > riscv hardware by performing the extra jump. Doing tail calls should be
> > avoided on riscv since the hardware can be expected to predict the
> > return address incorrectly every time if the return address is manually
> > changed.
> 
>  Fair enough, thanks.  Though no link to said patch given.

Oops! Here it is:
https://lore.kernel.org/linux-riscv/20240607061335.2197383-1-cyrilbur@tenstorrent.com/.

> 
>   Maciej
