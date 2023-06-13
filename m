Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D79DC567C
	for <loongarch@lists.linux.dev>; Tue, 13 Jun 2023 07:20:06 +0000 (UTC)
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-55b2fb308bbso2733343eaf.1
        for <loongarch@lists.linux.dev>; Tue, 13 Jun 2023 00:20:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686640806; x=1689232806;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fbl6hTPLrmpSWav/3sGvPZAOIrvUN7WR7CUdowhVquE=;
        b=MrAT7vB84gsPnCBXDMPZQ57ID68kQLjkCR2zenh8/TQ5R0PPkxWukms9tEEhXW5wT2
         3c2oBVhZpzv6vxtC+rPIblSCIc5FSAgIHBQAJ7oSp5VNkPec3glszSRR232r2XgWRreA
         X1IPZlvpdd3A+5diB/HlZKiPiIKwXLqhsq9Xa3mRDYJECci4h1lx68Op7KAEUXGZedW7
         oeGm25pr/3nMPQjvHq5OfCaNU75EKWcYASF3+mP0zluhCM/KppVvODlFOX6Ow887K3WY
         lYM54Ry4miKs3g+F/6ILqkNauaYhEYWHyERhVehqWfbXthatzDHkNWbUX548TZocyh0n
         C4Ew==
X-Gm-Message-State: AC+VfDzgDsLPZX2lAtKDVKy0yAdQ1tsNlFinkcZuSLug4MxL3XVo5AgV
	KzNQKNebgtsx2ztq4ARgVQh+nDDnYop53mDy
X-Google-Smtp-Source: ACHHUZ5FPTShgB1TwD/bmlNMXfueTk+1WyTKpYnaDxmtf+0dL5+StM2+OypVRrLzCgKw/Rpo3ijQ9w==
X-Received: by 2002:a05:6808:bc7:b0:39a:ba9c:ec9 with SMTP id o7-20020a0568080bc700b0039aba9c0ec9mr7076363oik.14.1686640805569;
        Tue, 13 Jun 2023 00:20:05 -0700 (PDT)
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com. [209.85.161.53])
        by smtp.gmail.com with ESMTPSA id w67-20020acadf46000000b00399ee6330a9sm1484591oig.52.2023.06.13.00.20.05
        for <loongarch@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jun 2023 00:20:05 -0700 (PDT)
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-555508fd7f9so2728732eaf.3
        for <loongarch@lists.linux.dev>; Tue, 13 Jun 2023 00:20:05 -0700 (PDT)
X-Received: by 2002:a25:b191:0:b0:ba8:3bc0:4d19 with SMTP id
 h17-20020a25b191000000b00ba83bc04d19mr680890ybj.28.1686640784641; Tue, 13 Jun
 2023 00:19:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230613001108.3040476-1-rick.p.edgecombe@intel.com> <20230613001108.3040476-2-rick.p.edgecombe@intel.com>
In-Reply-To: <20230613001108.3040476-2-rick.p.edgecombe@intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 13 Jun 2023 09:19:32 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX7K-9gXuOM3KkFieM_W2-Sbb3AVZ-sR65abRMdSBux5A@mail.gmail.com>
Message-ID: <CAMuHMdX7K-9gXuOM3KkFieM_W2-Sbb3AVZ-sR65abRMdSBux5A@mail.gmail.com>
Subject: Re: [PATCH v9 01/42] mm: Rename arch pte_mkwrite()'s to pte_mkwrite_novma()
To: Rick Edgecombe <rick.p.edgecombe@intel.com>
Cc: x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-mm@kvack.org, linux-arch@vger.kernel.org, linux-api@vger.kernel.org, 
	Arnd Bergmann <arnd@arndb.de>, Andy Lutomirski <luto@kernel.org>, Balbir Singh <bsingharora@gmail.com>, 
	Borislav Petkov <bp@alien8.de>, Cyrill Gorcunov <gorcunov@gmail.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Eugene Syromiatnikov <esyr@redhat.com>, 
	Florian Weimer <fweimer@redhat.com>, "H . J . Lu" <hjl.tools@gmail.com>, Jann Horn <jannh@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Kees Cook <keescook@chromium.org>, 
	Mike Kravetz <mike.kravetz@oracle.com>, Nadav Amit <nadav.amit@gmail.com>, 
	Oleg Nesterov <oleg@redhat.com>, Pavel Machek <pavel@ucw.cz>, Peter Zijlstra <peterz@infradead.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Weijiang Yang <weijiang.yang@intel.com>, 
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, John Allen <john.allen@amd.com>, kcc@google.com, 
	eranian@google.com, rppt@kernel.org, jamorris@linux.microsoft.com, 
	dethoma@microsoft.com, akpm@linux-foundation.org, Andrew.Cooper3@citrix.com, 
	christina.schimpe@intel.com, david@redhat.com, debug@rivosinc.com, 
	szabolcs.nagy@arm.com, torvalds@linux-foundation.org, broonie@kernel.org, 
	linux-alpha@vger.kernel.org, linux-snps-arc@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org, 
	linux-hexagon@vger.kernel.org, linux-ia64@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	Michal Simek <monstr@monstr.eu>, Dinh Nguyen <dinguyen@kernel.org>, linux-mips@vger.kernel.org, 
	openrisc@lists.librecores.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-um@lists.infradead.org, 
	Linus Torvalds <torvalds@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 13, 2023 at 2:13=E2=80=AFAM Rick Edgecombe
<rick.p.edgecombe@intel.com> wrote:
> The x86 Shadow stack feature includes a new type of memory called shadow
> stack. This shadow stack memory has some unusual properties, which requir=
es
> some core mm changes to function properly.
>
> One of these unusual properties is that shadow stack memory is writable,
> but only in limited ways. These limits are applied via a specific PTE
> bit combination. Nevertheless, the memory is writable, and core mm code
> will need to apply the writable permissions in the typical paths that
> call pte_mkwrite(). Future patches will make pte_mkwrite() take a VMA, so
> that the x86 implementation of it can know whether to create regular
> writable memory or shadow stack memory.
>
> But there are a couple of challenges to this. Modifying the signatures of
> each arch pte_mkwrite() implementation would be error prone because some
> are generated with macros and would need to be re-implemented. Also, some
> pte_mkwrite() callers operate on kernel memory without a VMA.
>
> So this can be done in a three step process. First pte_mkwrite() can be
> renamed to pte_mkwrite_novma() in each arch, with a generic pte_mkwrite()
> added that just calls pte_mkwrite_novma(). Next callers without a VMA can
> be moved to pte_mkwrite_novma(). And lastly, pte_mkwrite() and all caller=
s
> can be changed to take/pass a VMA.
>
> Start the process by renaming pte_mkwrite() to pte_mkwrite_novma() and
> adding the pte_mkwrite() wrapper in linux/pgtable.h. Apply the same
> pattern for pmd_mkwrite(). Since not all archs have a pmd_mkwrite_novma()=
,
> create a new arch config HAS_HUGE_PAGE that can be used to tell if
> pmd_mkwrite() should be defined. Otherwise in the !HAS_HUGE_PAGE cases th=
e
> compiler would not be able to find pmd_mkwrite_novma().
>
> No functional change.
>
> Cc: linux-doc@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-alpha@vger.kernel.org
> Cc: linux-snps-arc@lists.infradead.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-csky@vger.kernel.org
> Cc: linux-hexagon@vger.kernel.org
> Cc: linux-ia64@vger.kernel.org
> Cc: loongarch@lists.linux.dev
> Cc: linux-m68k@lists.linux-m68k.org
> Cc: Michal Simek <monstr@monstr.eu>
> Cc: Dinh Nguyen <dinguyen@kernel.org>
> Cc: linux-mips@vger.kernel.org
> Cc: openrisc@lists.librecores.org
> Cc: linux-parisc@vger.kernel.org
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: linux-riscv@lists.infradead.org
> Cc: linux-s390@vger.kernel.org
> Cc: linux-sh@vger.kernel.org
> Cc: sparclinux@vger.kernel.org
> Cc: linux-um@lists.infradead.org
> Cc: linux-arch@vger.kernel.org
> Cc: linux-mm@kvack.org
> Suggested-by: Linus Torvalds <torvalds@linuxfoundation.org>
> Signed-off-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
> Link: https://lore.kernel.org/lkml/CAHk-=3DwiZjSu7c9sFYZb3q04108stgHff2wf=
bokGCCgW7riz+8Q@mail.gmail.com/

>  arch/m68k/include/asm/mcf_pgtable.h          |  2 +-
>  arch/m68k/include/asm/motorola_pgtable.h     |  2 +-
>  arch/m68k/include/asm/sun3_pgtable.h         |  2 +-

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
