Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA629154B4
	for <loongarch@lists.linux.dev>; Tue, 20 Jun 2023 15:32:46 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-518b69d5b5dso6720844a12.1
        for <loongarch@lists.linux.dev>; Tue, 20 Jun 2023 08:32:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687275165; x=1689867165;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P0jVFIWxWqZ/TuBplqDvmEEANKo26b83Dz5MygWHhzo=;
        b=R2BhcgahF4eA1vnlN0qyJmASSGyaKyq8k8oOrUAtCf6A4nOmgevBEhPzEV8rIbjTgF
         yXzVElUQYcMdeYQTQkO+X2Y+9ZuwgkppnVdZSXyRsEkPbs6x/ssnctoQke0QTIMErPf3
         qLgAPk3+Vpo3W0G2QiGZq35LggwDfRrpFYUUYGCVB1g7szVQ79eBlKEygcj7p7OVjxQf
         pa51oJokqPD+3D2MoPj8cm17qxZzYmsGb5TOKjwNPuJs0U4g/8S2QCH5/u+vSkwhFWvm
         3m8n5V/yFyRQTrN52yzRlNSqLm1w2gZ7QUzER3KDhhogdRbdvNc25JV4yGkEnTVq2UW0
         ShAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687275165; x=1689867165;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P0jVFIWxWqZ/TuBplqDvmEEANKo26b83Dz5MygWHhzo=;
        b=gYI3vNVr+pee3B1bQLzjet7XYWvlg/u6eUq8sSmLVVlS6oMhykRE282Mwfnf7keaoj
         H1y3wOO9I8ZPjiBcWHhMSAeqXENWqj4hzC/nZHIoQBFUjuVuAcGxrP0MfeZqdgLXNptn
         l99muzBdwIU79jCGvYQEmPwxc8VOtY0zHarSNMFr5uKs0VztQkAFj1Jw8QoX07FdIH4f
         MwN2nShhxWmjN942PLpnq04tDeN7RgPs7SlW9cQ+B8RJpeFAmOq/yegdq4r3QW8qmdxn
         B7eWyo2PkUBDw+b8hlbRmT1HdbKs3JUMh3ObB0PiL679ybdJ28YQvOo4KTX4b23QBai8
         qz4w==
X-Gm-Message-State: AC+VfDx2a/mikwzbsPOX1IUni5HIjHqTy1ekT3rx52HNVv8hcx7zFPvW
	q8RexY7QyFPW6w1JSCdO/oFN0i04OOUMa/ehvho=
X-Google-Smtp-Source: ACHHUZ5ux98lA0dfOqVXfQP0ndlYyBoHuqHpCIjpPqNu3qgP8TLa7JJDdMIHBmrGJ6oD7j3SfcbrFl7+8TyeQPspzGA=
X-Received: by 2002:aa7:cf16:0:b0:51a:40ca:d081 with SMTP id
 a22-20020aa7cf16000000b0051a40cad081mr7305340edy.27.1687275164525; Tue, 20
 Jun 2023 08:32:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230616085038.4121892-1-rppt@kernel.org> <20230616085038.4121892-7-rppt@kernel.org>
 <87jzw0qu3s.ffs@tglx> <20230618231431.4aj3k5ujye22sqai@moria.home.lan>
 <87h6r4qo1d.ffs@tglx> <20230620105104.60cb64d8@gandalf.local.home>
In-Reply-To: <20230620105104.60cb64d8@gandalf.local.home>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Tue, 20 Jun 2023 08:32:33 -0700
Message-ID: <CAADnVQK_dWhPxdjs4HuAXWBTeVAf01er15dZU8tC+d=g6QCPXw@mail.gmail.com>
Subject: Re: [PATCH v2 06/12] mm/execmem: introduce execmem_data_alloc()
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Kent Overstreet <kent.overstreet@linux.dev>, 
	Mike Rapoport <rppt@kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, "David S. Miller" <davem@davemloft.net>, 
	Dinh Nguyen <dinguyen@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, Helge Deller <deller@gmx.de>, 
	Huacai Chen <chenhuacai@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nadav Amit <nadav.amit@gmail.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Puranjay Mohan <puranjay12@gmail.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Russell King <linux@armlinux.org.uk>, 
	Song Liu <song@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Will Deacon <will@kernel.org>, bpf <bpf@vger.kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-mips@vger.kernel.org, 
	linux-mm <linux-mm@kvack.org>, linux-modules@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linux-riscv <linux-riscv@lists.infradead.org>, 
	linux-s390 <linux-s390@vger.kernel.org>, linux-trace-kernel@vger.kernel.org, 
	ppc-dev <linuxppc-dev@lists.ozlabs.org>, loongarch@lists.linux.dev, 
	Network Development <netdev@vger.kernel.org>, sparclinux@vger.kernel.org, 
	X86 ML <x86@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 20, 2023 at 7:51=E2=80=AFAM Steven Rostedt <rostedt@goodmis.org=
> wrote:
>
> On Mon, 19 Jun 2023 02:43:58 +0200
> Thomas Gleixner <tglx@linutronix.de> wrote:
>
> > Now you might argue that it _is_ a "hotpath" due to the BPF usage, but
> > then even more so as any intermediate wrapper which converts from one
> > data representation to another data representation is not going to
> > increase performance, right?
>
> Just as a side note. BPF can not attach its return calling code to
> functions that have more than 6 parameters (3 on 32 bit x86), because of
> the way BPF return path trampoline works. It is a requirement that all
> parameters live in registers, and none on the stack.

It's actually 7 and that restriction is being lifted.
The patch set to attach to <=3D 12 is being discussed.
