Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B9489CA57
	for <loongarch@lists.linux.dev>; Thu, 21 Sep 2023 22:11:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5A9BC433C7
	for <loongarch@lists.linux.dev>; Thu, 21 Sep 2023 22:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695334260;
	bh=N5hdFpyXSiGpYG0511NDyp6fv24cJcs4QSVnP7w1UAU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=CZWymKek5IwdPscqX1AfRLp+BDVUpgLN79ZLQETlKuNMr+2pfulTSOMjhX7t7D5C+
	 j5UTmDZhA/F/nEUbZqucKuD9tJCb7E5cRHRLnl/HXDGrId5UyrNckbgebRUuseN/EK
	 gqaCXv7LjA+4h26RxhG3mtNqPzOqpLDH9RsmPLfVY2Y3ZELZfn1OonC6k7ZML7qBcC
	 CxkS74NiUYRzAVXEqAONYsUWdfShMj5f4rfpOp6filBNtFQj+ISuLS5Fx17rKELXgx
	 6JjXn01r44elKMCt8dqDV4oyfM+W7Uj9Lm3Tfiyb8iAM59icuOGlXNqTKmsGnkEmb+
	 qrtRSJ+8WPASA==
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-52bd9ddb741so1751312a12.0
        for <loongarch@lists.linux.dev>; Thu, 21 Sep 2023 15:11:00 -0700 (PDT)
X-Gm-Message-State: AOJu0Yx88WxQbdVnJ6hMBCj3tbLedlFVyRwCQ6ywjYZeEcuCdpjnkeGB
	vqS1xheMKopTOFCKm1Mtbva4kn+GXA4+aNq+PXY=
X-Google-Smtp-Source: AGHT+IFpnRd6TFzlAtTmG0SVL+ey3URugDNbqT5vmaLEkxDXDZHK88BxPcak1tSmyXSq9q54rWpyKjCd5XFO26LBHOk=
X-Received: by 2002:a19:6903:0:b0:4fe:2d93:2b50 with SMTP id
 e3-20020a196903000000b004fe2d932b50mr5173357lfc.31.1695334238605; Thu, 21 Sep
 2023 15:10:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230918072955.2507221-1-rppt@kernel.org> <20230918072955.2507221-3-rppt@kernel.org>
In-Reply-To: <20230918072955.2507221-3-rppt@kernel.org>
From: Song Liu <song@kernel.org>
Date: Thu, 21 Sep 2023 15:10:26 -0700
X-Gmail-Original-Message-ID: <CAPhsuW4bQY5fo_+K2z4uUdd4r0wYF1eT3bAya=YqcEcmqdGXvg@mail.gmail.com>
Message-ID: <CAPhsuW4bQY5fo_+K2z4uUdd4r0wYF1eT3bAya=YqcEcmqdGXvg@mail.gmail.com>
Subject: Re: [PATCH v3 02/13] mm: introduce execmem_text_alloc() and execmem_free()
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

On Mon, Sep 18, 2023 at 12:30=E2=80=AFAM Mike Rapoport <rppt@kernel.org> wr=
ote:
>
[...]
> +
> +#include <linux/mm.h>
> +#include <linux/vmalloc.h>
> +#include <linux/execmem.h>
> +#include <linux/moduleloader.h>
> +
> +static void *execmem_alloc(size_t size)
> +{
> +       return module_alloc(size);
> +}
> +
> +void *execmem_text_alloc(enum execmem_type type, size_t size)
> +{
> +       return execmem_alloc(size);
> +}

execmem_text_alloc (and later execmem_data_alloc) both take "type" as
input. I guess we can just use execmem_alloc(type, size) for everything?

Thanks,
Song

> +
> +void execmem_free(void *ptr)
> +{
> +       /*
> +        * This memory may be RO, and freeing RO memory in an interrupt i=
s not
> +        * supported by vmalloc.
> +        */
> +       WARN_ON(in_interrupt());
> +       vfree(ptr);
> +}
> --
> 2.39.2
>
