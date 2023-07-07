Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F1DABA3A
	for <loongarch@lists.linux.dev>; Fri,  7 Jul 2023 13:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1688737226;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eSLQOQX2Flx1G07KYazrMVvBAcWU6hFPEM6DlSyIig8=;
	b=G/uACz5ZMYyUiBErHIFDax28DghqIzhNdXg9hD2UX3+2ZAdpZhDSwCYiENc5NKQsrCSYkY
	pRAyDCVNqQLnsPZqG7gp8JjuN62Y7fATqb9sdDf/GtYHfW8aaG7c2r0a5RxAATckEYop3O
	FBmJ8tsnHWG9swbK2UKdSBOQB7GAQbw=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-218-Yt0SufPnM5eAuMdsdNvKuQ-1; Fri, 07 Jul 2023 09:40:24 -0400
X-MC-Unique: Yt0SufPnM5eAuMdsdNvKuQ-1
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3142665f122so965003f8f.0
        for <loongarch@lists.linux.dev>; Fri, 07 Jul 2023 06:40:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688737223; x=1691329223;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eSLQOQX2Flx1G07KYazrMVvBAcWU6hFPEM6DlSyIig8=;
        b=kgKHgZStItM3GYyTT0Ct4xbX2H7QUN6PzErK7pMOXeptx4qyDzsXHXgEcYNGjmsK+N
         yPlPWLJTx58q88Jn0nYUlg6R0vZM0rlDicblDNX4c1aviMv2Mm56ZXhwwSKq1VJ4CRtO
         GqfiIA607q0iusN1KRwV15gz3lrbgGxn5tw+A0ZcgiHQbIYkaJGTTV6yvgRBWU8tiKkA
         D2xLWSDmM6s5jXf+GqAY2IftPep0L04drF4HiEpMCxV0bOK43d2Vw79awEfIbmPvrKGw
         nyWn1s45bf9u/AmWC8BHf++67Q6gICW5SQk5lZmwytyZyAqBLeajHpf/WL5WGWUvkFHr
         tgYA==
X-Gm-Message-State: ABy/qLYr6W6IvXVMd84Q/QAby7Py51lc9RLDPOrHxddmjioFJ/iq+EBw
	A4XzW1RT7wvgE04WabHUnrTdeGirs4qOj3Qwd/0Uecswjhd3+d+Cl8WCu45VUl2o8j/Bg/34epP
	FcyZBuOdv6LKqMKIc+yXx
X-Received: by 2002:adf:fd84:0:b0:314:2c7a:d100 with SMTP id d4-20020adffd84000000b003142c7ad100mr3491321wrr.42.1688737223528;
        Fri, 07 Jul 2023 06:40:23 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGembFVs9w4+Nx6kwExMzgs9gyKSxG86BN2Jn1gUhGo+dJC0cQ0C5x3R9/Olki3X8v+sW6RJQ==
X-Received: by 2002:adf:fd84:0:b0:314:2c7a:d100 with SMTP id d4-20020adffd84000000b003142c7ad100mr3491295wrr.42.1688737223237;
        Fri, 07 Jul 2023 06:40:23 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id x4-20020a5d60c4000000b003112ab916cdsm4482161wrt.73.2023.07.07.06.40.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jul 2023 06:40:23 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Arnd Bergmann <arnd@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org, Russell King
 <linux@armlinux.org.uk>, dri-devel@lists.freedesktop.org, Ard Biesheuvel
 <ardb@kernel.org>, Helge Deller <deller@gmx.de>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, Richard
 Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky
 <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Huacai Chen
 <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, Thomas
 Bogendoerfer <tsbogend@alpha.franken.de>, Michael Ellerman
 <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe
 Leroy <christophe.leroy@csgroup.eu>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, linux-alpha@vger.kernel.org,
 linux-ia64@vger.kernel.org, loongarch@lists.linux.dev,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org
Subject: Re: [PATCH 2/4] vgacon: rework screen_info #ifdef checks
In-Reply-To: <20230707095415.1449376-2-arnd@kernel.org>
References: <20230707095415.1449376-1-arnd@kernel.org>
 <20230707095415.1449376-2-arnd@kernel.org>
Date: Fri, 07 Jul 2023 15:40:22 +0200
Message-ID: <87jzvbyh4p.fsf@minerva.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

Arnd Bergmann <arnd@kernel.org> writes:

> From: Arnd Bergmann <arnd@arndb.de>
>
> On non-x86 architectures, the screen_info variable is generally only
> used for the VGA console where supported, and in some cases the EFI
> framebuffer or vga16fb.
>
> Now that we have a definite list of which architectures actually use it
> for what, use consistent #ifdef checks so the global variable is only
> defined when it is actually used on those architectures.
>
> On powerpc, there is no support for vgacon, but there is support for
> vga16fb. Loongarch and riscv have no support for vgacon or vga16fb, but
> they support EFI firmware, so only that needs to be checked, and the
> initialization can be removed because that is handled by EFI.
> IA64 has both vgacon and EFI.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---

[...]

> diff --git a/arch/ia64/kernel/setup.c b/arch/ia64/kernel/setup.c
> index 5a55ac82c13a4..0c09ff7fde46b 100644
> --- a/arch/ia64/kernel/setup.c
> +++ b/arch/ia64/kernel/setup.c
> @@ -86,9 +86,11 @@ EXPORT_SYMBOL(local_per_cpu_offset);
>  #endif
>  unsigned long ia64_cycles_per_usec;
>  struct ia64_boot_param *ia64_boot_param;
> +#if defined(CONFIG_VGA_CONSOLE) || defined(CONFIG_EFI)
>  struct screen_info screen_info;

I think that only screen_info should be guarded by both symbols ?

>  unsigned long vga_console_iobase;

It seems this variable was never used since it was introduced by commit
66b7f8a30437 ("[IA64-SGI] pcdp: add PCDP pci interface support") ?

>  unsigned long vga_console_membase;

And this is only used by mdacon (not supported by ia64), vgacon and
vga16fb (not supported by ia64 either).

So this could just be guarded just by CONFIG_VGA_CONSOLE for ia64 ?

The rest of the patch looks good to me.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

