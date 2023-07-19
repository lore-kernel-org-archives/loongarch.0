Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FDE313FE0
	for <loongarch@lists.linux.dev>; Wed, 19 Jul 2023 13:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689774557;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7gvBqRrgzjiPOFgHQxEB0Nm34S2dkYf27eWyqPPlFhY=;
	b=KJVvEZatHoppvFwBWUxQq7s6QEbVmghGy33UzWvbupWugdHY890+Z8FIO+6JozgEmZ99ag
	XoMkEcE8Jv9tPNZG9nZCqE1DjyQaVkFgDFwOakW+cz7SbL1S6J3YEvbQgEJfc3jlHd/XSX
	MCmUAbxK0vtlhhCvBYrzhic9pViDW+c=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-648-p2BwsWlgPdWWTcijSR_GNA-1; Wed, 19 Jul 2023 09:49:13 -0400
X-MC-Unique: p2BwsWlgPdWWTcijSR_GNA-1
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-314394a798dso378670f8f.0
        for <loongarch@lists.linux.dev>; Wed, 19 Jul 2023 06:49:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689774552; x=1690379352;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7gvBqRrgzjiPOFgHQxEB0Nm34S2dkYf27eWyqPPlFhY=;
        b=awn1WwQwFX9w4AW8xaaGykgMSPsOPOvXAg86wAe/ZLwH9vvHr8hPm4+JPeQdaolZnV
         dkg6MWRI8WCVDKbm3LrkIJP6ZgUBB+gGrdIzewQGSAPGbDMZWzM7fqojqb7NP3s2dsFJ
         nJUpmmKN37UFktxiRaWozzUZkC2+xWSb4M3PGcXgeG0h9BGWhKgXfr9MxU5eW7mMycmB
         hl9YSmo4UDzEerCqNnGcgGkWh0+wtSW4/gCPzU9dx9qTEZKdYs5TFfSyJT/h9EPm/zql
         Tp8QgveOGuQI1yT/MgAUMhWDOW0H165EkmirUlVHQeVlF7GipIahMuq3iMRB2OFzdQW5
         4iuQ==
X-Gm-Message-State: ABy/qLbd/mKi66oy+Hsmr33DkC9/PSj4xuHB5ENsAUBeBiW+vsAnaJU7
	nDFP93a4sU5Dwg34BUEovwpAz/cpjlb3xxuXlll6PF4XVQkS8lIkfW1TdG9wgfvDF0ycSaoyzxf
	jtb/VLAUN0LVQrUj/hE+Y
X-Received: by 2002:a5d:6a04:0:b0:314:3369:df57 with SMTP id m4-20020a5d6a04000000b003143369df57mr1948336wru.5.1689774552642;
        Wed, 19 Jul 2023 06:49:12 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFD8G6VPVcqqGeSjptpNDnOnSs3W+CAZM63rDbbbVz9hymKgoyuOl3Kik6r5ce0mC8oQNhizg==
X-Received: by 2002:a5d:6a04:0:b0:314:3369:df57 with SMTP id m4-20020a5d6a04000000b003143369df57mr1948300wru.5.1689774552274;
        Wed, 19 Jul 2023 06:49:12 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id q2-20020a5d6582000000b003143bb5ecd5sm5381303wru.69.2023.07.19.06.49.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jul 2023 06:49:11 -0700 (PDT)
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
Subject: Re: [PATCH v2 5/9] vgacon: remove screen_info dependency
In-Reply-To: <20230719123944.3438363-6-arnd@kernel.org>
References: <20230719123944.3438363-1-arnd@kernel.org>
 <20230719123944.3438363-6-arnd@kernel.org>
Date: Wed, 19 Jul 2023 15:49:11 +0200
Message-ID: <87fs5khuzs.fsf@minerva.mail-host-address-is-not-set>
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
> The vga console driver is fairly self-contained, and only used by
> architectures that explicitly initialize the screen_info settings.
>
> Chance every instance that picks the vga console by setting conswitchp
> to call a function instead, and pass a reference to the screen_info
> there.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

