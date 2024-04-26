Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 777DBB641
	for <loongarch@lists.linux.dev>; Fri, 26 Apr 2024 18:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714157339; cv=none; b=KxgyWfRT+jO3nzs2WBsXnSZYzJPL7z6ZxKDVSS+y6B6OKeMfV+qzlho1/vwQuhaf9D6Zx3w5VBJDWXJYphVBQgDRxiLiD6a4AaTHEdws5UbTtTtdDAPwJ+LQVDDI5pQoBPdZK42f4aBYV5GDQfvJ2SDGl0clHc21Djn2cP1T7bY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714157339; c=relaxed/simple;
	bh=Hyt9cSwCpY4B/TYQfJ50zYLktchyWIPJ9BFUEyet93w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k+a8onfjaPZaEhM/68beeUvNgycMzW10C1LD9CIQeazKfnan6Oo4wMMU7UjoQUHXRov/ljAdggGn7FhiwuA1tx5x5IWx4A8+hqcDY5fEWA/HrYBJl1HidCKwk0ubXNZSwxsOt6fDMnzmMVLgiS84CYCw+ayy774l+bQ7fYMiUp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=omYAU1IX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="omYAU1IX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07082C32782
	for <loongarch@lists.linux.dev>; Fri, 26 Apr 2024 18:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714157339;
	bh=Hyt9cSwCpY4B/TYQfJ50zYLktchyWIPJ9BFUEyet93w=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=omYAU1IXV9+aEbDj3WzW0h9hh8slJ6O7XeR+/el/aPqUqQwmKhrubaGLHKe6F/qoN
	 MF+QpGdmepVtXJUi7qama/N7eevr0uRpmYWfEfpXLSn6po+EWJvAbPwC2DhrLI3Kab
	 hJ199D+YKxooUwvQVGdcrlpnMlIEyMQgklGmPUYAf/XrIPcYb3cOhCDCEb44zY+ScT
	 8H+f6nd/+2QAaoW6Nq9tDlYwdHx4ptj/yBo6F5lGXLrMeKvbCOKH6aeIbvrbL7Fybn
	 2RHvumUyuxx4wndL1SUhPGeKdgBggcopxtT5HeSovKS35OYcI+ydKSkv7psvdEYrD1
	 k2XNEU9BvXk/A==
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5724f26b8c9so2530188a12.1
        for <loongarch@lists.linux.dev>; Fri, 26 Apr 2024 11:48:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVOdY/DGiv7nk26tuwioKJ5atUE2ICqHESOYCufStSC0pAZ8OmTwCj4+4HiAbBeMLt/uFbeHoc94mf79JY1TDxVHzmwGl3rPwdd
X-Gm-Message-State: AOJu0YxHTRmAVrpyy4GSvbtb96gNZ9C3CMtcuXCV0yrckxTfByASnA0h
	e6B0Ri8fWVAusVu32NJPqo/gQrlmpofB4sLjRMVp6zRLwLwKXu+2N329203NC9kLMt4o6uCj4hi
	K9t0GlnY8XPLJZGHbZsoVMUqsKS0=
X-Google-Smtp-Source: AGHT+IFMUG93L8El2Q8N1eCq6gv3PwlvgFwZKVcKUA/i/TE/TYvbrOCl1aD96inecCeUz3meYOs5/CsGWzmxgWNQdJE=
X-Received: by 2002:a05:6512:5cb:b0:51a:cc71:b91d with SMTP id
 o11-20020a05651205cb00b0051acc71b91dmr149470lfo.19.1714157316791; Fri, 26 Apr
 2024 11:48:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240426082854.7355-1-rppt@kernel.org> <20240426082854.7355-6-rppt@kernel.org>
In-Reply-To: <20240426082854.7355-6-rppt@kernel.org>
From: Song Liu <song@kernel.org>
Date: Fri, 26 Apr 2024 11:48:25 -0700
X-Gmail-Original-Message-ID: <CAPhsuW75813E1MrdMYrqJXvuunbiJ046vT_EoReXA-60HJxT+Q@mail.gmail.com>
Message-ID: <CAPhsuW75813E1MrdMYrqJXvuunbiJ046vT_EoReXA-60HJxT+Q@mail.gmail.com>
Subject: Re: [PATCH v6 05/16] module: make module_memory_{alloc,free} more self-contained
To: Mike Rapoport <rppt@kernel.org>
Cc: linux-kernel@vger.kernel.org, Alexandre Ghiti <alexghiti@rivosinc.com>, 
	Andrew Morton <akpm@linux-foundation.org>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	"David S. Miller" <davem@davemloft.net>, Dinh Nguyen <dinguyen@kernel.org>, 
	Donald Dutile <ddutile@redhat.com>, Eric Chanudet <echanude@redhat.com>, 
	Heiko Carstens <hca@linux.ibm.com>, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, 
	Kent Overstreet <kent.overstreet@linux.dev>, Luis Chamberlain <mcgrof@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nadav Amit <nadav.amit@gmail.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Peter Zijlstra <peterz@infradead.org>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Russell King <linux@armlinux.org.uk>, 
	Sam Ravnborg <sam@ravnborg.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Thomas Gleixner <tglx@linutronix.de>, 
	Will Deacon <will@kernel.org>, bpf@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-mm@kvack.org, linux-modules@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, 
	netdev@vger.kernel.org, sparclinux@vger.kernel.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 26, 2024 at 1:30=E2=80=AFAM Mike Rapoport <rppt@kernel.org> wro=
te:
>
> From: "Mike Rapoport (IBM)" <rppt@kernel.org>
>
> Move the logic related to the memory allocation and freeing into
> module_memory_alloc() and module_memory_free().
>
> Signed-off-by: Mike Rapoport (IBM) <rppt@kernel.org>
Acked-by: Song Liu <song@kernel.org>
