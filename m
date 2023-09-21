Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4B5920308
	for <loongarch@lists.linux.dev>; Thu, 21 Sep 2023 22:15:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FC9CC433C9
	for <loongarch@lists.linux.dev>; Thu, 21 Sep 2023 22:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695334529;
	bh=j+YpilMLGCC5ERDcgjdZY/UEYbvSwBxJ4mCRlrG3+go=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=hn9ZaKDqwiZrJjYgN809tOEAfp1yIlqdCOC1lGT5Gpl+AbdOsxLPtDK4JWaRaOvr9
	 KT5GMfU+h+u0YCvBTM6QPOAyk7au6MQ1N7w7pvw+JCRG4tEP8VlIGwdKfVkc/IVZ5W
	 +2UmHfF5j/su0ejJG9erZeWyAxS0vVonjj/HaSLXkrx31zLfZ+GWhyQL/zMG2V29DC
	 H3pDhTNbf9jJUfSzpMgJ1B7EohgFOWbO8bc9c/RDVF4PyE2U5RST3T9nXatNjWcaCa
	 3TWfBKltcErClz0TDvxyuPJ+NqwRU77MtviQZk4KQLvhyzCQkYtw6Fvu1D69WdwJZ1
	 Mj9t1TZb2IIMA==
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3214d4ecd39so1403016f8f.1
        for <loongarch@lists.linux.dev>; Thu, 21 Sep 2023 15:15:29 -0700 (PDT)
X-Gm-Message-State: AOJu0YxJOzC1Ez0KBixTDG2AQovCRtnGJgpNdFaOOgQLqcrwe1APjvmP
	mdw+ufwmGJOxAzG6feDRkuKJSKH8nS+rh3yMa6Q=
X-Google-Smtp-Source: AGHT+IEOsdVYa+3bdtK+lEO/ooz4+HKzafq7xPbE1njdx3C8+57KFx3hJ2XTTULe0kNONSMtwPONNYKDgjY7yPaLcMU=
X-Received: by 2002:a05:6512:3254:b0:503:1c07:f7f9 with SMTP id
 c20-20020a056512325400b005031c07f7f9mr5552939lfr.29.1695334506735; Thu, 21
 Sep 2023 15:15:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230918072955.2507221-1-rppt@kernel.org> <20230918072955.2507221-3-rppt@kernel.org>
In-Reply-To: <20230918072955.2507221-3-rppt@kernel.org>
From: Song Liu <song@kernel.org>
Date: Thu, 21 Sep 2023 15:14:54 -0700
X-Gmail-Original-Message-ID: <CAPhsuW7y2T+tajK71NfYhquhGJKpLpL+EoxxzqrVhEuAamDH3w@mail.gmail.com>
Message-ID: <CAPhsuW7y2T+tajK71NfYhquhGJKpLpL+EoxxzqrVhEuAamDH3w@mail.gmail.com>
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
> +/**
> + * enum execmem_type - types of executable memory ranges
> + *
> + * There are several subsystems that allocate executable memory.
> + * Architectures define different restrictions on placement,
> + * permissions, alignment and other parameters for memory that can be us=
ed
> + * by these subsystems.
> + * Types in this enum identify subsystems that allocate executable memor=
y
> + * and let architectures define parameters for ranges suitable for
> + * allocations by each subsystem.
> + *
> + * @EXECMEM_DEFAULT: default parameters that would be used for types tha=
t
> + * are not explcitly defined.
> + * @EXECMEM_MODULE_TEXT: parameters for module text sections
> + * @EXECMEM_KPROBES: parameters for kprobes
> + * @EXECMEM_FTRACE: parameters for ftrace
> + * @EXECMEM_BPF: parameters for BPF
> + * @EXECMEM_TYPE_MAX:
> + */
> +enum execmem_type {
> +       EXECMEM_DEFAULT,

I found EXECMEM_DEFAULT more confusing than helpful.

Song

> +       EXECMEM_MODULE_TEXT =3D EXECMEM_DEFAULT,
> +       EXECMEM_KPROBES,
> +       EXECMEM_FTRACE,
> +       EXECMEM_BPF,
> +       EXECMEM_TYPE_MAX,
> +};
> +
[...]
