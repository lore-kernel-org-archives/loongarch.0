Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BECB61E9B35
	for <loongarch@lists.linux.dev>; Tue, 15 Jul 2025 14:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752591537; cv=none; b=saGFehsqESiiHFVHPmHwexrsbGLVYMqgoOZkkAO5sLNU2RMCbtoFnFWSEloqhHslAFj0Ax5PUrIkjCi8sSajC4ogjbTZ2hP67yrez5PewW7aJA4Ny2ZEI24G8+bsC5B5zEMdoYz66162ur3Jm3y1ujGetYdslrewvtxfXVBPC+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752591537; c=relaxed/simple;
	bh=RJgtZNUEZzN9hGx+4AfBFEa2QJOzHnj3a+2Fa0Jy63A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kj7Swc3W7B92uob2yvcgEJg6iXA9egikFOYAfe8+C1Mdne6QUb9HswfzVoLfufXwwcR8wMc3vGutSz6he62486r9h9lZ+prgeKl10cuadZlO2u4mjlAWIwtNAMKpW/wWujf/c5s8WMsHIJoV7RHc9GNS+L+5EZEEtgJZ/9EyYEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=QuPHLciT; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="QuPHLciT"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-747fba9f962so4581679b3a.0
        for <loongarch@lists.linux.dev>; Tue, 15 Jul 2025 07:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1752591534; x=1753196334; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Mvahs9K3Kwf003Xrbc0oMQlkzIbQnUN8rpvZVnAjj48=;
        b=QuPHLciTrkxtusOOhK9TOM2G5nv4nAG0vFKEuByiC0/PC0KnLpMLMUc29p5XhDWQVS
         s4nG70X2QMq0tlLnnshMblkIzHxUWBRLbRKgkJa5RHGs45b1DA+aKOp9QNFDpz1dgEuP
         0D+7jxEJbJ0JSoVXtGScIRALMTEiXVW63L81HtR8ZfyunMc852rXcuLgrE6MEY6R23fv
         kJ+s+Yhf9vYF5bjbXrmZuIGEXaQAXp0Qa16IllnBcpOmEctbQlD9MKpVfnGrnL9x1PSZ
         G1xocX7ptmkLLVpqeVfSf8mBR483n6p358Fg/UfHWLkdh6RNC1WBJaAX4oyVIO+KIvUR
         vGCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752591534; x=1753196334;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mvahs9K3Kwf003Xrbc0oMQlkzIbQnUN8rpvZVnAjj48=;
        b=v6J2xT+KXdUpAeScxFNbTPBHdaaPHR3JwQ07iNatt3xHrZy0UyWXV//AuguVG6CYV3
         irxAnMNRhcnbeBmtGdCj3tVnouxwHfCHp9mPQduqzuhWJngEGkgHCzIoVQshv7H0gmDk
         va3lMMI39RNVQQTMRpkYlMOpQ/4YJJ5St26K9DkSwmLrlwOatrWfTpWyiZTIg1a3UJ4D
         AfM6XxN58Cu7E/2P89Bm6KRR3LHjgY3oWfYwEcVunmu0loSGxltfvFMLLH97BncC7RgQ
         z5C3SYlXoGVqRXyXZ7Kdd54LYv8fTUKJmR60bxkCVFmyaF/rabl2Gkwt95G3ld465lOS
         EUUQ==
X-Forwarded-Encrypted: i=1; AJvYcCWgL5jM9FxW+YYIoyqrs4OpRBebDIOZz0jDn6BckZ7OqD3eIHVcx74slMZyX2nzE9fyHDcbYIR+MZo=@lists.linux.dev
X-Gm-Message-State: AOJu0YwcwVYs/OSNcfO+pwyK1+aH0URAEc6l2IQCctdC2jlgjwPcWkS0
	4pYT/lKJ/FEV60VgsjLNmvYCHe8SLSnJegPEZ6evO/Wp7MY7/V+xB/Xi39/JjRfV4Lg=
X-Gm-Gg: ASbGncvGfGCNylEn/lZaCE9Es34BcLYRf5odc3M7j31w3iqEo2VoFX97J+8+DzEYFGl
	JQLtT/BWJJs9hG6TPdnm9RMUA4hClNXrMz83ZjGane9SXi4n2g4re4GQI9dnIDwD/+euPu2IwVM
	l2GZmdPr0wZioC33vh7f+wUTYpy7Jauz3PZnh+57GYWAnCtZphQTletdq0n6CBncfWFp1Ff7zws
	g5DxI2El0ISUuIaPEaUjOqSaBWJ4ZhSTHjtx62OK52YSgBykUK14cYVDXJsP7SH6+HA1eKo52TV
	ySEdQnZw/DGs6OriVfAbO/YHGkiJ+H+NgjeCZ0UHFZFueQBUEmi4FZ+Smv6G8VrQ8HvPv1yp+t2
	3GzyXzrw3ZBZEOxSkniXuHUCB2115EA==
X-Google-Smtp-Source: AGHT+IGWqmTNcmPppTn41XmZxoBqwnqg0u0bN/W4bU7UhI4lYpV4O4cn1UsFVwKVvFBue7Ekoyiq4A==
X-Received: by 2002:a05:6a00:ad0:b0:746:195b:bf1c with SMTP id d2e1a72fcca58-75584eb932emr5340905b3a.10.1752591533903;
        Tue, 15 Jul 2025 07:58:53 -0700 (PDT)
Received: from sunil-laptop ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9f1b6fbsm12327709b3a.84.2025.07.15.07.58.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 07:58:53 -0700 (PDT)
Date: Tue, 15 Jul 2025 20:28:42 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
	Ard Biesheuvel <ardb+git@google.com>,
	linux-arm-kernel@lists.infradead.org,
	Feng Tang <feng.tang@linux.alibaba.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Bibo Mao <maobibo@loongson.cn>, linux-rtc@vger.kernel.org,
	linux-efi@vger.kernel.org, xen-devel@lists.xenproject.org,
	x86@kernel.org, linux-riscv@lists.infradead.org,
	loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 0/3] Remove unused EFI runtime APIs
Message-ID: <aHZsohPoxLYML___@sunil-laptop>
References: <20250714060843.4029171-5-ardb+git@google.com>
 <422e2a72-972f-41f4-a0b3-d69a6cb0c2e2@canonical.com>
 <CAMj1kXEXpBF8hPaVMU0sDgNysYT66MDRmr3JHO4Lg1sJB_Yteg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMj1kXEXpBF8hPaVMU0sDgNysYT66MDRmr3JHO4Lg1sJB_Yteg@mail.gmail.com>

On Tue, Jul 15, 2025 at 01:29:15PM +1000, Ard Biesheuvel wrote:
> On Mon, 14 Jul 2025 at 18:11, Heinrich Schuchardt
> <heinrich.schuchardt@canonical.com> wrote:
> >
> > On 7/14/25 08:08, Ard Biesheuvel wrote:
> > > From: Ard Biesheuvel <ardb@kernel.org>
> > >
> > > Using EFI runtime services to program the RTC to wake up the system is
> > > supported in theory, but rarely works in practice. Fortunately, this
> > > functionality is rarely [if ever] used to begin with so we can just drop
> > > it. (Note that the EFI rtc driver is not used by x86, which programs the
> > > CMOS rtc directly)
> >
> > The main problem I see with firmware offering access to the RTC via UEFI
> > services is that two different drivers, the firmware one and the Linux
> > one might be trying to access the same busses or registers which might
> > lead to unexpected results.
> >
> > Recently there was a discussion in the RISC-V technical group for the
> > server platform specification where the same issue was discussed
> > concerning SetTime().
> >
> > As a UEFI firmware should not care which operating system is booted, it
> > should be up to the OS to disable EFI access to the RTC if it has native
> > access.
> >
> > Could we disable all the EFI services for the RTC in Linux dynamically
> > when an RTC driver is successfully probed?
> >
> 
> I don't think this would be the right way to do it.
> 
> It also depends on whether ACPI or DT is being used to describe the
> platform to the OS.
> 
> ACPI does not support describing the RTC device, so it should provide
> the EFI services.
> 
Hi Ard,
IIUC, TAD is defined for this purpose, right? 
https://uefi.org/specs/ACPI/6.6/09_ACPI_Defined_Devices_and_Device_Specific_Objects.html#time-and-alarm-device

> DT can describe the RTC device directly, so I think it is acceptable
> for such firmware to mark all RTC routines unsupported in the RT_PROP
> table, and just expose the RTC device directly.
> 
> The OS shouldn't have to reason about these things: it is up to the
> platform to describe itself unambiguously.

I agree. But I think even with ACPI, EFI GetTime/SetTime can return
unsupported if there is a TAD exposed with proper _GRT/_SRT and _GCP.

Thanks,
Sunil
