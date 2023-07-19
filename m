Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A36014008
	for <loongarch@lists.linux.dev>; Wed, 19 Jul 2023 14:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689776712;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xY+xsOpuPsAa6KICDwWDt2PoXyQ0u/vopB2mSitD/gY=;
	b=WMF3x1Fmt+xfSiHrnFh/QfgZ5hZ/n9AFVrEydXR/KESgnfTaxKRikMHxQbkYpCnxrC7LPn
	b9RUi8xE41OMdk/N2Cp/s7d2XdSmAolU3uU8/rpGyK9P6M8czhbc6xPpTPDpvahH0Bg6DP
	evV4IPrWufQex92dAqUDP0R8V6fMc9s=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-488-oUXcqSvpN76zVtK0PVG-7Q-1; Wed, 19 Jul 2023 10:25:11 -0400
X-MC-Unique: oUXcqSvpN76zVtK0PVG-7Q-1
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-315af0252c2so4208154f8f.0
        for <loongarch@lists.linux.dev>; Wed, 19 Jul 2023 07:25:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689776710; x=1690381510;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xY+xsOpuPsAa6KICDwWDt2PoXyQ0u/vopB2mSitD/gY=;
        b=DGXAMNPznCaSOXc3c9dQNME7704u07hYOjUJCedX9mZDAni6hgKBu4jehBtIFMm2Yr
         4Wcd7FPdijgVyA29bSD/p+FPYjuRKODUiGixgpGkfOj3piho4kashKdlW5E1TjdQXcTq
         G4FfTAcsR/V/JmjwcOcirDN2E29W90gxRbjNg8hNhE823iXGuvFQFnstrR8iaLK6xNzM
         6USG2JmPh89zZl3GepxE2bE/MG+BeBj89pxmKsQ7YDC1ffmBSJgpgInXWyYe4nKn3+RD
         tFBtsVIIX3p/3krjvPJMJkfFzBg+wfuIYtx1fMxoV2vOqUx9XFRUfDfu2b8pFyP+bOR7
         8Rcg==
X-Gm-Message-State: ABy/qLbu8eY3/lUO6CsBHl52a6QH5eafML2YY9YqJqJdY4k4OZ7rGY9T
	CMHXfc7pLA7folpkCmO6Yk9ArjfRGuOvY1iKm7m7g/U/xw0AoH0CBm+if4YMGEOKWxLwtJs417z
	AaLkSrtY9qGnc/1yoO2ht
X-Received: by 2002:adf:f6d2:0:b0:315:a2a0:e331 with SMTP id y18-20020adff6d2000000b00315a2a0e331mr15872wrp.50.1689776710229;
        Wed, 19 Jul 2023 07:25:10 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHdsBbmhlUZVwgJXnbSuIEfuMAzDx5IOvgnijOdvMDteAVkW8k0bDz3T8ek9eZvK84UcEFXkg==
X-Received: by 2002:adf:f6d2:0:b0:315:a2a0:e331 with SMTP id y18-20020adff6d2000000b00315a2a0e331mr15829wrp.50.1689776709888;
        Wed, 19 Jul 2023 07:25:09 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id t13-20020a7bc3cd000000b003fc05b89e5bsm1805793wmj.34.2023.07.19.07.25.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jul 2023 07:25:09 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Arnd Bergmann <arnd@kernel.org>, linux-fbdev@vger.kernel.org, Thomas
 Zimmermann <tzimmermann@suse.de>, Helge Deller <deller@gmx.de>
Cc: Arnd Bergmann <arnd@arndb.de>, "David S. Miller" <davem@davemloft.net>,
 "K. Y. Srinivasan" <kys@microsoft.com>, Ard Biesheuvel <ardb@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Brian Cain <bcain@quicinc.com>, Catalin
 Marinas <catalin.marinas@arm.com>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Daniel Vetter <daniel@ffwll.ch>, Dave
 Hansen <dave.hansen@linux.intel.com>, David Airlie <airlied@gmail.com>,
 Deepak Rawat <drawat.floss@gmail.com>, Dexuan Cui <decui@microsoft.com>,
 Dinh Nguyen <dinguyen@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Guo Ren <guoren@kernel.org>, Haiyang Zhang
 <haiyangz@microsoft.com>, Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar
 <mingo@redhat.com>, John Paul Adrian Glaubitz
 <glaubitz@physik.fu-berlin.de>, Khalid Aziz <khalid@gonehiking.org>, Linus
 Walleij <linus.walleij@linaro.org>, Matt Turner <mattst88@gmail.com>, Max
 Filippov <jcmvbkbc@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Russell King <linux@armlinux.org.uk>, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>, Thomas Gleixner <tglx@linutronix.de>, WANG
 Xuerui <kernel@xen0n.name>, Wei Liu <wei.liu@kernel.org>, Will Deacon
 <will@kernel.org>, x86@kernel.org, linux-alpha@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-efi@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-hexagon@vger.kernel.org, linux-ia64@vger.kernel.org,
 loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-hyperv@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 8/9] hyperv: avoid dependency on screen_info
In-Reply-To: <20230719123944.3438363-9-arnd@kernel.org>
References: <20230719123944.3438363-1-arnd@kernel.org>
 <20230719123944.3438363-9-arnd@kernel.org>
Date: Wed, 19 Jul 2023 16:25:08 +0200
Message-ID: <877cqwhtbv.fsf@minerva.mail-host-address-is-not-set>
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
> The two hyperv framebuffer drivers (hyperv_fb or hyperv_drm_drv) access the
> global screen_info in order to take over from the sysfb framebuffer, which
> in turn could be handled by simplefb, simpledrm or efifb. Similarly, the
> vmbus_drv code marks the original EFI framebuffer as reserved, but this
> is not required if there is no sysfb.
>
> As a preparation for making screen_info itself more local to the sysfb
> helper code, add a compile-time conditional in all three files that relate
> to hyperv fb and just skip this code if there is no sysfb that needs to
> be unregistered.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

