Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56D5BC8F6
	for <loongarch@lists.linux.dev>; Fri,  7 Jul 2023 15:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1688743627;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+8qlgKJYI7kB6D1e5SNd04VHZ2yM21oq3nfTt/gANL8=;
	b=Xp3V7QpxR0t4kn3riQcIygCunUkXwI6NZ3Tna1R1/eSSKIttUgnUBIEMa0bUEAsweRM2gc
	U6nnWomAy9UZxVmI7MDDjcPICPUqvUyj2cWWhWFPcUxqtL/gbiqKCzm2QxuPCdKnlNpwQG
	VW5QSR7ucZvmaJXYRS7+9Gx7xwPi09M=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-75-knvlmZoBObahq80aADC0yg-1; Fri, 07 Jul 2023 11:27:05 -0400
X-MC-Unique: knvlmZoBObahq80aADC0yg-1
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-31444df0fafso1019677f8f.2
        for <loongarch@lists.linux.dev>; Fri, 07 Jul 2023 08:27:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688743624; x=1691335624;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+8qlgKJYI7kB6D1e5SNd04VHZ2yM21oq3nfTt/gANL8=;
        b=atspKZW/S0PHGdj7z8/YYN50AY2nL6hiqlZuSbIqyslN7YY5EnWOrbacnKIYv0eMv9
         FEqenBXDBNTQRBObMlucFYE7BIoAa1QeolGA6J27RNqHrCGiHg4tv+t9r+1iGw5Ga3bv
         ix/hLHxC9O4zm92x6h7dYjjonmJn9SmetErvJBkkBipGMCUNbHIyCOfk4VGLQey+67jW
         c7esrE0uxg72U7goa0ZroKWyAfavA59EdCD4HJ+CnjLGvDN+34B6Itab6ZvV50B+Yknp
         iPoNziWuTCUMNcBoYrC4VnDPoUMsWAbnMhEOHzMV1snqpW+YMCzb/tG3RH3Y6cE2PeqQ
         L8Ug==
X-Gm-Message-State: ABy/qLbA/zwu1+h51qEyCOQ3Ts6Q3NYxRziadFHRGXibndW/UetLaaOj
	+7OtrlvvJIex/R/tfVo+wRKtvzfCmLx37/uPpU4oz8t5ANaTYhktciq2t++PQcyFN+Q4IJnsCD2
	o4mxeb+TdbsSgl7PORs6e
X-Received: by 2002:adf:f052:0:b0:30a:a15d:eb2f with SMTP id t18-20020adff052000000b0030aa15deb2fmr4668084wro.3.1688743624752;
        Fri, 07 Jul 2023 08:27:04 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGmxd1jbrrvV1R0iu/TeFKW/e1nuXfI0DnXijMIXAlyALphvzgzqltgfOe8J565vUOEzxyvoA==
X-Received: by 2002:adf:f052:0:b0:30a:a15d:eb2f with SMTP id t18-20020adff052000000b0030aa15deb2fmr4668074wro.3.1688743624480;
        Fri, 07 Jul 2023 08:27:04 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id bl1-20020adfe241000000b003143c9beeaesm4711005wrb.44.2023.07.07.08.27.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jul 2023 08:27:04 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Arnd Bergmann <arnd@arndb.de>, Arnd Bergmann <arnd@kernel.org>, Thomas
 Zimmermann <tzimmermann@suse.de>
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org, Russell King
 <linux@armlinux.org.uk>, dri-devel@lists.freedesktop.org, Ard Biesheuvel
 <ardb@kernel.org>, Helge Deller <deller@gmx.de>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Richard Henderson
 <richard.henderson@linaro.org>, Ivan Kokshaysky
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
In-Reply-To: <ff9bfcfa-fa3b-42d2-b429-059b5103bce2@app.fastmail.com>
References: <20230707095415.1449376-1-arnd@kernel.org>
 <20230707095415.1449376-2-arnd@kernel.org>
 <87jzvbyh4p.fsf@minerva.mail-host-address-is-not-set>
 <ff9bfcfa-fa3b-42d2-b429-059b5103bce2@app.fastmail.com>
Date: Fri, 07 Jul 2023 17:27:03 +0200
Message-ID: <87bkgnyc6w.fsf@minerva.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

"Arnd Bergmann" <arnd@arndb.de> writes:

> On Fri, Jul 7, 2023, at 15:40, Javier Martinez Canillas wrote:

[...]

>> And this is only used by mdacon (not supported by ia64), vgacon and
>> vga16fb (not supported by ia64 either).
>>
>> So this could just be guarded just by CONFIG_VGA_CONSOLE for ia64 ?
>
> Right, I though about doing this more accurately, but in the end
> went for the simplest change rather than spending much more time
> trying to clean up the unused variables etc.
>
> Let me know if you'd prefer me to respin this part, otherwise
> I'd call the ia64 bit good enough for the purpose of the series.
>

No need to re-spin, agreed that makes sense to keep it simpler.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

