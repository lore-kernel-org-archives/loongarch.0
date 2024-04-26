Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BE9EB64C
	for <loongarch@lists.linux.dev>; Fri, 26 Apr 2024 18:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714157458; cv=none; b=OsgYi78Rd0lb+U40zIgxXZrncZw5zKjRPf8wWlha/xM26jr2QRd1wqO1NzQXik9fAH2y3GwoALk8B08vc4nlkwmnz7Qbo8LSO0rMP4R1bM2q6/Lb3kJMN1/3aQooa5lzgcbejqZ+RKRkNw42ONg3HKLjIQCRS6wgsYA5p42ymhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714157458; c=relaxed/simple;
	bh=qzSv2gnEZ82yuyykHlGJGrukq6yL7NdagG67pBjWhfw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oDxN1QvGZnpuFT/gNg7fzY3YHTQEV/3fU8I71kA5aVSIP0ORK9bZOyJr5ElVnsuwLIA8tGF38YIyuOdGhm8ugoyByofNB86sWGwyqDPxF8kBmK6FfFh+NSFpotHh5TYL/YV6X2ZlZhO//vJm6m2khyyC5Cwhb/J/7AmznwVod+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G31cPiC6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G31cPiC6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F0C0C2BD11
	for <loongarch@lists.linux.dev>; Fri, 26 Apr 2024 18:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714157457;
	bh=qzSv2gnEZ82yuyykHlGJGrukq6yL7NdagG67pBjWhfw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=G31cPiC6TK9kOZfS+7vIsvfHb7uuZNOwj55DutBKEwvj1ZktMpti079oDLoQepzqx
	 wVszL7O0AJVxtjaOjY0n9kY4/Bve7m6gE0ic4Iybrzklpad4O8Ro4Zf5m6HkkhiJ2+
	 w3461SEnX9aUsT6TIAtdY2xAhX4Y1lrXomoRm91/r6VXYAPdqg/BAUR9Ku0+ffN2fF
	 +m/rEaMDw+oIuNEa2S2MKLtCa+l5O0n2aCdo6H2uhPypnxbndLUx0bGMePJQhqLBqn
	 5LBIsT64XdigQdLAx2qvxJDfAfqchkz63z7zPloWzIi6w7OHWw93PJ1yRE7jC7BXYK
	 k1xLvs7Vr7U6Q==
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a58e2740cd7so10659766b.1
        for <loongarch@lists.linux.dev>; Fri, 26 Apr 2024 11:50:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUtO8il5rmJ6WdWibaGo5XmjAwp2vNwtDrOuUO3TtZkSmhykRY8AkxaLAk6xXtlK2PaiaNXh5BVXMBjYG0Ey8ViUG094NjuXPTb
X-Gm-Message-State: AOJu0YzWRomECmpDeB2kIisd/AbQ7EbRxQr9ok0WIMR3KyYYAzd/HtLf
	6VPuU97qicPMkuiEUdlkPtiveZAk29jJA76eJOdeneiEOVoxVJE9LBHaMcLeBbmkgnXMCHZLe5C
	OUnWEbXWCTF0nM495Y3npi/BXOFU=
X-Google-Smtp-Source: AGHT+IEtbFUWWfDryHUamYvitrmf8tAKbyELfuzd/vDmOPU4uvcIS74lAE+iFPq4wKESZs2zgaxMHYvoVHUDPQWBV9c=
X-Received: by 2002:a05:6512:3116:b0:516:ce34:e4fc with SMTP id
 n22-20020a056512311600b00516ce34e4fcmr167995lfb.31.1714157435505; Fri, 26 Apr
 2024 11:50:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240426082854.7355-1-rppt@kernel.org> <20240426082854.7355-7-rppt@kernel.org>
In-Reply-To: <20240426082854.7355-7-rppt@kernel.org>
From: Song Liu <song@kernel.org>
Date: Fri, 26 Apr 2024 11:50:24 -0700
X-Gmail-Original-Message-ID: <CAPhsuW6FZqYXvk4anxby8MccwejPPK5DNU-NGmg7_6T1XDU=Hg@mail.gmail.com>
Message-ID: <CAPhsuW6FZqYXvk4anxby8MccwejPPK5DNU-NGmg7_6T1XDU=Hg@mail.gmail.com>
Subject: Re: [PATCH v6 06/16] mm: introduce execmem_alloc() and execmem_free()
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
> module_alloc() is used everywhere as a mean to allocate memory for code.
>
> Beside being semantically wrong, this unnecessarily ties all subsystems
> that need to allocate code, such as ftrace, kprobes and BPF to modules an=
d
> puts the burden of code allocation to the modules code.
>
> Several architectures override module_alloc() because of various
> constraints where the executable memory can be located and this causes
> additional obstacles for improvements of code allocation.
>
> Start splitting code allocation from modules by introducing execmem_alloc=
()
> and execmem_free() APIs.
>
> Initially, execmem_alloc() is a wrapper for module_alloc() and
> execmem_free() is a replacement of module_memfree() to allow updating all
> call sites to use the new APIs.
>
> Since architectures define different restrictions on placement,
> permissions, alignment and other parameters for memory that can be used b=
y
> different subsystems that allocate executable memory, execmem_alloc() tak=
es
> a type argument, that will be used to identify the calling subsystem and =
to
> allow architectures define parameters for ranges suitable for that
> subsystem.
>
> No functional changes.
>
> Signed-off-by: Mike Rapoport (IBM) <rppt@kernel.org>
> Acked-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>

Acked-by: Song Liu <song@kernel.org>
