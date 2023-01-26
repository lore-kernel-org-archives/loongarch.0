Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDECF1FA1
	for <loongarch@lists.linux.dev>; Thu, 26 Jan 2023 08:20:56 +0000 (UTC)
Received: by mail-qt1-f176.google.com with SMTP id x17so711334qto.10
        for <loongarch@lists.linux.dev>; Thu, 26 Jan 2023 00:20:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iTLUhLqiktW0lQYPPHgLpL0hyET/yRv7DDBqjk/47Fc=;
        b=BDfQdvVwy8p+PdqKdFUUh3Y8SIt1IzpbnWby6u8kV3//cnR99pAl7HQ/x9z5DXG5yQ
         3LevzyRTo8qnm9xpiceqGGCSiPhalkZAVeJEFmXo2y80O5w/IEahg6We9WtALfVhzo2m
         X8NI426oeugz3qUYq/HsNWLkWtXoiynN8i/WQ4DcVF1OpzcQg3dw92fWNPdDLAhmKaxv
         yOxlTQdOS3Yb3wddA2hxjtxrXHx+oo2jNnUY8xd7zu4uD6RdatV+/fofIzCi2/CUGDAP
         m4DOz7Mnr5s7h8jY3iC+MzvHSwUsIWsTAEMYa2xnolh47GoO3enxz+eKbSw8RI/wOGF/
         DxgQ==
X-Gm-Message-State: AO0yUKVFrrn5vKT21/4JBs9CxWnvcqDcQ3w+bTfo0RIfkP6ETHmbfCLo
	mAiOSKnwB2A+zV80uFdG1dMiNZY2y2Xx2A==
X-Google-Smtp-Source: AK7set9+DYk5FKqpI2uSHNSvjriPN7QrdfGDBHD+he28FNCcbWPrmtjBLJEdpuPn26tvCBukH6fG6Q==
X-Received: by 2002:a05:622a:489:b0:3b8:118c:f0dd with SMTP id p9-20020a05622a048900b003b8118cf0ddmr861345qtx.1.1674721255632;
        Thu, 26 Jan 2023 00:20:55 -0800 (PST)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com. [209.85.219.169])
        by smtp.gmail.com with ESMTPSA id o12-20020a05622a044c00b003a82ca4e81csm334543qtx.80.2023.01.26.00.20.55
        for <loongarch@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jan 2023 00:20:55 -0800 (PST)
Received: by mail-yb1-f169.google.com with SMTP id 123so1114209ybv.6
        for <loongarch@lists.linux.dev>; Thu, 26 Jan 2023 00:20:55 -0800 (PST)
X-Received: by 2002:a25:9ac1:0:b0:7b4:6a33:d89f with SMTP id
 t1-20020a259ac1000000b007b46a33d89fmr2761883ybo.543.1674721245117; Thu, 26
 Jan 2023 00:20:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230125190757.22555-1-rppt@kernel.org> <20230125190757.22555-2-rppt@kernel.org>
In-Reply-To: <20230125190757.22555-2-rppt@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Jan 2023 09:20:33 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUeuPgkWVjpZ=OM4ofnoYyv2nY1_FGo0JUZCFXYX=K2vw@mail.gmail.com>
Message-ID: <CAMuHMdUeuPgkWVjpZ=OM4ofnoYyv2nY1_FGo0JUZCFXYX=K2vw@mail.gmail.com>
Subject: Re: [PATCH 1/3] m68k: use asm-generic/memory_model.h for both MMU and !MMU
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Brian Cain <bcain@quicinc.com>, "David S. Miller" <davem@davemloft.net>, 
	Dinh Nguyen <dinguyen@kernel.org>, Greg Ungerer <gerg@linux-m68k.org>, Guo Ren <guoren@kernel.org>, 
	Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Matt Turner <mattst88@gmail.com>, 
	Max Filippov <jcmvbkbc@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>, Michal Simek <monstr@monstr.eu>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Rich Felker <dalias@libc.org>, 
	Richard Weinberger <richard@nod.at>, Stafford Horne <shorne@gmail.com>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Vineet Gupta <vgupta@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	linux-alpha@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux--csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	linux-ia64@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-sh@vger.kernel.org, linux-snps-arc@lists.infradead.org, 
	linux-um@lists.infradead.org, linux-xtensa@linux-xtensa.org, 
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, 
	openrisc@lists.librecores.org, sparclinux@vger.kernel.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, Jan 25, 2023 at 8:08 PM Mike Rapoport <rppt@kernel.org> wrote:
> From: "Mike Rapoport (IBM)" <rppt@kernel.org>
>
> The MMU variant uses generic definitions of page_to_pfn() and
> pfn_to_page(), but !MMU defines them in include/asm/page_no.h for no
> good reason.
>
> Include asm-generic/memory_model.h in the common include/asm/page.h and
> drop redundant definitions.
>
> Signed-off-by: Mike Rapoport (IBM) <rppt@kernel.org>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
