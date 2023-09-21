Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E6DA7F2
	for <loongarch@lists.linux.dev>; Thu, 21 Sep 2023 22:31:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04218C433C7
	for <loongarch@lists.linux.dev>; Thu, 21 Sep 2023 22:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695335481;
	bh=MM21fpAAqNycTt4Xaf9NDcGQ0SQTcft6//RqlmbkVyQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=SOWQNasQGWZTuKNMoTOL7N9CW8mEM7jeB0HtB4Y4xG3twlUCcmDOR//tpoaovkq2Z
	 LNv5a1uVSTJ8gYYjHqQsLoujPt9ql27rlu7a/BDP4z6nwr+uhyU78Or+VbnivLBGqa
	 nCn04qhEbLMw2yWE81Ax1OT/Q7gzTyLC7H7fqzOT2xJ/eUI2VNlRqJpSLtz3UM/wAc
	 6t5I3eu+z7sHu6CotPgPEN7UIv78/putoG6aws0sWhKHe4VvkRlsOBKuM/+K1HjWRe
	 veCN3akmrsWfRoOlZsNzVBYLBUsLevN+Ccg2RV6/5LOxJkYjQ3Hnu6+9g/DkxUUfd3
	 yT/5ewwyq4/bw==
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3200bc30666so1397595f8f.2
        for <loongarch@lists.linux.dev>; Thu, 21 Sep 2023 15:31:20 -0700 (PDT)
X-Gm-Message-State: AOJu0Yyk71L47zCcWb4VbohID43sSS0b8rmjqw6xOZd/fBnfQ/Z4ji7b
	ordALwiNij/ts2f/N/hbwC+nNA2Yv9b+RjFnDXk=
X-Google-Smtp-Source: AGHT+IH8pmyQuqpvewRyL7QPTAL4jcebA+VNDdobgdjzXZOsPDkVCcZQaQNB105RzqTdIxkf8GblFKytjbdsRKyccPQ=
X-Received: by 2002:a05:6512:10c4:b0:500:7f71:e46b with SMTP id
 k4-20020a05651210c400b005007f71e46bmr7439120lfg.1.1695335458957; Thu, 21 Sep
 2023 15:30:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230918072955.2507221-1-rppt@kernel.org> <20230918072955.2507221-10-rppt@kernel.org>
In-Reply-To: <20230918072955.2507221-10-rppt@kernel.org>
From: Song Liu <song@kernel.org>
Date: Thu, 21 Sep 2023 15:30:46 -0700
X-Gmail-Original-Message-ID: <CAPhsuW5Vg7yDn8zb5ez4JY4efoQ6aW+vYm9OL+Xr0NJnLfMYHg@mail.gmail.com>
Message-ID: <CAPhsuW5Vg7yDn8zb5ez4JY4efoQ6aW+vYm9OL+Xr0NJnLfMYHg@mail.gmail.com>
Subject: Re: [PATCH v3 09/13] powerpc: extend execmem_params for kprobes allocations
To: Mike Rapoport <rppt@kernel.org>
Cc: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	"David S. Miller" <davem@davemloft.net>, Dinh Nguyen <dinguyen@kernel.org>, 
	Heiko Carstens <hca@linux.ibm.com>, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, 
	Kent Overstreet <kent.overstreet@linux.dev>, Luis Chamberlain <mcgrof@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nadav Amit <nadav.amit@gmail.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Puranjay Mohan <puranjay12@gmail.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Russell King <linux@armlinux.org.uk>, 
	Steven Rostedt <rostedt@goodmis.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>, bpf@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-mm@kvack.org, linux-modules@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, 
	netdev@vger.kernel.org, sparclinux@vger.kernel.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 18, 2023 at 12:31=E2=80=AFAM Mike Rapoport <rppt@kernel.org> wr=
ote:
>
[...]
> @@ -135,5 +138,13 @@ struct execmem_params __init *execmem_arch_params(vo=
id)
>
>         range->pgprot =3D prot;
>
> +       execmem_params.ranges[EXECMEM_KPROBES].start =3D VMALLOC_START;
> +       execmem_params.ranges[EXECMEM_KPROBES].start =3D VMALLOC_END;

.end =3D VMALLOC_END.

Thanks,
Song

> +
> +       if (strict_module_rwx_enabled())
> +               execmem_params.ranges[EXECMEM_KPROBES].pgprot =3D PAGE_KE=
RNEL_ROX;
> +       else
> +               execmem_params.ranges[EXECMEM_KPROBES].pgprot =3D PAGE_KE=
RNEL_EXEC;
> +
>         return &execmem_params;
>  }
> --
> 2.39.2
>
>
