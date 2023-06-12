Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D04E8833
	for <loongarch@lists.linux.dev>; Mon, 12 Jun 2023 19:46:53 +0000 (UTC)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-56ce61769b7so30386827b3.3
        for <loongarch@lists.linux.dev>; Mon, 12 Jun 2023 12:46:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686599212; x=1689191212;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QqdHZRyf0AXNBHWGF0CLQrBOhqQeYTmWOmQD+ocjfOs=;
        b=SXYr8A4pnIIdr6za8OENs4c8uh4dxxNEIZiE/sLNIVtmAbLyfx07bfpmKCw0rriwAQ
         bZaDwQSLsXOfsGIlSMF01YpA51d2M0b8UJHaUtKbAGwqYbjQxIyIGTnGc1naXCR6FLWY
         mHISXiUPApcM+Qum8w1RFyNXyA6YgsPPvC+2qspsLS5N3oBhYt27NpRcZw4yMFTx+OQh
         tgViv/WBFL2KuSxQCaBcLXvfS7l9VUYQrIrcB2mZWkkXuF46BAW9eyfyYjKwqDaGZ5fF
         VPl94qnptEgKYrW88wkiIbMMePR4TgtD7Xxug2dW4y1vsrw7B8C9uCMIHIvcnf4tKkEj
         9U3g==
X-Gm-Message-State: AC+VfDz1XkK5xt3rDD+IQBuUng1EYrJZjdK7eYbeILalnROTSyPDcygL
	lKZNuJcEe6WpESBL3i4GHQdiv2uTZta6qg==
X-Google-Smtp-Source: ACHHUZ6No8hSN0un15w8q/BPZaJV9pQ/RAmegninFtwb/i6hazo10lxw0GGPclJHO7JOZaNEkyhr3Q==
X-Received: by 2002:a0d:f9c4:0:b0:565:a8dd:c6f4 with SMTP id j187-20020a0df9c4000000b00565a8ddc6f4mr11433052ywf.33.1686599212061;
        Mon, 12 Jun 2023 12:46:52 -0700 (PDT)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com. [209.85.219.171])
        by smtp.gmail.com with ESMTPSA id j81-20020a816e54000000b00569e7cbcd56sm2672251ywc.69.2023.06.12.12.46.51
        for <loongarch@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jun 2023 12:46:51 -0700 (PDT)
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-bc4f89f0f2fso2810715276.3
        for <loongarch@lists.linux.dev>; Mon, 12 Jun 2023 12:46:51 -0700 (PDT)
X-Received: by 2002:a05:6358:c6a9:b0:12b:db2f:9d2b with SMTP id
 fe41-20020a056358c6a900b0012bdb2f9d2bmr2288064rwb.22.1686598742584; Mon, 12
 Jun 2023 12:39:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230612172805.681179-1-eric.devolder@oracle.com> <20230612172805.681179-8-eric.devolder@oracle.com>
In-Reply-To: <20230612172805.681179-8-eric.devolder@oracle.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 12 Jun 2023 21:38:50 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXAbRVALNVwFhO1S3zsOuVj7OidEF8=0K=qQ-kFn6JQiA@mail.gmail.com>
Message-ID: <CAMuHMdXAbRVALNVwFhO1S3zsOuVj7OidEF8=0K=qQ-kFn6JQiA@mail.gmail.com>
Subject: Re: [PATCH v1 07/21] m68k/kexec: refactor for kernel/Kconfig.kexec
To: Eric DeVolder <eric.devolder@oracle.com>
Cc: linux@armlinux.org.uk, catalin.marinas@arm.com, will@kernel.org, 
	chenhuacai@kernel.org, tsbogend@alpha.franken.de, 
	James.Bottomley@hansenpartnership.com, deller@gmx.de, 
	ysato@users.sourceforge.jp, dalias@libc.org, glaubitz@physik.fu-berlin.de, 
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, 86@kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, kernel@xen0n.name, 
	mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	hca@linux.ibm.com, gor@linux.ibm.com, agordeev@linux.ibm.com, 
	borntraeger@linux.ibm.com, svens@linux.ibm.com, hpa@zytor.com, 
	keescook@chromium.org, paulmck@kernel.org, peterz@infradead.org, 
	frederic@kernel.org, akpm@linux-foundation.org, ardb@kernel.org, 
	samitolvanen@google.com, juerg.haefliger@canonical.com, arnd@arndb.de, 
	rmk+kernel@armlinux.org.uk, linus.walleij@linaro.org, 
	sebastian.reichel@collabora.com, rppt@kernel.org, 
	kirill.shutemov@linux.intel.com, anshuman.khandual@arm.com, ziy@nvidia.com, 
	masahiroy@kernel.org, ndesaulniers@google.com, mhiramat@kernel.org, 
	ojeda@kernel.org, thunder.leizhen@huawei.com, xin3.li@intel.com, 
	tj@kernel.org, gregkh@linuxfoundation.org, tsi@tuyoix.net, bhe@redhat.com, 
	hbathini@linux.ibm.com, sourabhjain@linux.ibm.com, boris.ostrovsky@oracle.com, 
	konrad.wilk@oracle.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 12, 2023 at 7:29=E2=80=AFPM Eric DeVolder <eric.devolder@oracle=
.com> wrote:
> The kexec and crash kernel options are provided in the common
> kernel/Kconfig.kexec. Utilize the common options and provide
> the ARCH_HAS_ and ARCH_SUPPORTS_ entries to recreate the
> equivalent set of KEXEC and CRASH options.
>
> Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
