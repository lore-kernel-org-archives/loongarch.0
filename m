Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4837E383C64
	for <loongarch@lists.linux.dev>; Mon, 25 May 2026 13:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779715057; cv=none; b=eJZ1y+k/4HTDAlsdcmRoTpqJGGZbY8zEngZI/6s3bPraZ2CI+OKEAx84TDy/u70lN9Ab0NbkXehoujNLJQW+m3kPknY6V01eCh2YGIoy2rN0NfyWTukaItcH4+XUb6r5j/37Coqf9ulJYg4cS31ZdCTss7DYLIqQB3++bTzG5cQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779715057; c=relaxed/simple;
	bh=8QUfqHvbfMaPCgLIrZLjy/3mv0ftTpCmKARkCaMm+Mc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oSHW6fFx8xLgaZbDmSpcDM8R8S//ZGVfwneMHC8r4g5ebRw62btzW9tUPs+7NAAROJ7TqK+gikAMJvhN5w5i3eMpRjKkU9SnhIJ750LtKFAIP1XgLDfkElIrWMuN31XDqasTRzK4IjLfcMrd8hU++Ffy+4CHjcjvvi83tYoEhcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dCpzrAvf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dCpzrAvf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FD3D1F00A3A
	for <loongarch@lists.linux.dev>; Mon, 25 May 2026 13:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779715056;
	bh=qV78+XoJ5yl4lw7jTkTV5DIdhzm9s8UbSBBAw5Rneo4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=dCpzrAvfgk9mSUU6JI5HHHez6L14UFh5dckZN5DAlujdAQMm/PYPxcKDOMc41IypU
	 NgmmttTk+nJ7gpnOe4Eg8v+8FV8RT+v5Ae+glRPhqcxzGZd/+6hgMw0F7yv/+6rQz4
	 X95gdQuJUyAKc1hWH3Gy1/l+TIZX2idKqbCpGmaVwhcsQRUGGQYoJHz3dhHrh2l/au
	 j0SXMMWwm+qgnDiXn93t6TJoPrAZ5gm82qSecFVClh3KPL2gWZzu9niNd8OSefMoGl
	 agHzEYaoQKd6HOPeiZMWEfzv0bjMM/EusAmU3Hy1nMtvCCD/Sa2YxNSMJTFxPK7Fzo
	 JaK+HMaC87z/g==
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-bd124546379so1468488066b.3
        for <loongarch@lists.linux.dev>; Mon, 25 May 2026 06:17:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9+X1CAeKQROT7s0NlatZGakRKlrqin3J1FMhK0Kmpx+7rzleOIqtlQ2rYEUORjAMbvPE4gwQd3mnI=@lists.linux.dev
X-Gm-Message-State: AOJu0YzyYvJTD1foCjTJ6O60da9rf4tGP71idPSLgegjJezJb3Ec85c9
	knW1oj8/azKrBVYLz1AT+NuiZEm+oTEgGU2H9ZcNlW6OeWNXqqir37EOVEqjKs4cMsLzrS4piUD
	3EXYhe/Ml81kysOK68ROH9rsX4sc3Mes=
X-Received: by 2002:a17:906:5a58:b0:bd5:7c2:7622 with SMTP id
 a640c23a62f3a-bdd26fcc664mr633046266b.49.1779715053431; Mon, 25 May 2026
 06:17:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260525084932.934910-1-ruanjinjie@huawei.com>
 <CAAhV-H4NA7vgyxKnK+N_3C6pWBnwXc2URUyLh_h1m-MO=MnsGQ@mail.gmail.com> <ahQ0WRiMsB011tym@kernel.org>
In-Reply-To: <ahQ0WRiMsB011tym@kernel.org>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Mon, 25 May 2026 21:17:21 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5x3m08=acrUr2VOAQ8-r2PhN1xTdr3NihHocoPM5=3hQ@mail.gmail.com>
X-Gm-Features: AVHnY4KF6iz3ZOONNz4YfBuRaFyzFjWLq0_9v1vlnlGZ6xwTI_B6DWjmlURC67Q
Message-ID: <CAAhV-H5x3m08=acrUr2VOAQ8-r2PhN1xTdr3NihHocoPM5=3hQ@mail.gmail.com>
Subject: Re: [PATCH v14 00/17] arm64/riscv: Add support for crashkernel CMA reservation
To: Mike Rapoport <rppt@kernel.org>
Cc: Jinjie Ruan <ruanjinjie@huawei.com>, corbet@lwn.net, skhan@linuxfoundation.org, 
	catalin.marinas@arm.com, will@kernel.org, kernel@xen0n.name, 
	maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	chleroy@kernel.org, pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, tglx@kernel.org, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, hpa@zytor.com, robh@kernel.org, 
	saravanak@kernel.org, akpm@linux-foundation.org, bhe@redhat.com, 
	pasha.tatashin@soleen.com, pratyush@kernel.org, ruirui.yang@linux.dev, 
	rdunlap@infradead.org, pmladek@suse.com, feng.tang@linux.alibaba.com, 
	dapeng1.mi@linux.intel.com, kees@kernel.org, elver@google.com, 
	kuba@kernel.org, lirongqing@baidu.com, ebiggers@kernel.org, 
	paulmck@kernel.org, thuth@redhat.com, ardb@kernel.org, masahiroy@kernel.org, 
	mark.rutland@arm.com, maz@kernel.org, james.morse@arm.com, leitao@debian.org, 
	sourabhjain@linux.ibm.com, yeoreum.yun@arm.com, coxu@redhat.com, 
	jbohac@suse.cz, ryan.roberts@arm.com, cfsworks@gmail.com, 
	tangyouling@kylinos.cn, ritesh.list@gmail.com, songshuaishuai@tinylab.org, 
	junhui.liu@pigmoral.tech, vishal.moola@gmail.com, kas@kernel.org, 
	debug@rivosinc.com, namcao@linutronix.de, liaoyuanhong@vivo.com, 
	fuqiang.wang@easystack.cn, seanjc@google.com, guoren@kernel.org, 
	chenjiahao16@huawei.com, hbathini@linux.ibm.com, bgwin@google.com, 
	takahiro.akashi@linaro.org, lizhengyu3@huawei.com, x86@kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, kexec@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 25, 2026 at 7:37=E2=80=AFPM Mike Rapoport <rppt@kernel.org> wro=
te:
>
> Hi Huacai,
>
> On Mon, May 25, 2026 at 06:14:52PM +0800, Huacai Chen wrote:
> > On Mon, May 25, 2026 at 4:50=E2=80=AFPM Jinjie Ruan <ruanjinjie@huawei.=
com> wrote:
> > >
> > > Jinjie Ruan (16):
> > >   riscv: kexec_file: Fix crashk_low_res not exclude bug
> > >   powerpc/crash: Fix possible memory leak in update_crash_elfcorehdr(=
)
> > >   arm64: kexec: Fix image->elf_headers memory leak during retry loop
> > >   x86/kexec: Fix potential buffer overflow in prepare_elf_headers()
> > >   arm64: kexec_file: Fix potential buffer overflow in
> > >     prepare_elf_headers()
> > >   riscv: kexec_file: Fix potential buffer overflow in
> > >     prepare_elf_headers()
> > >   LoongArch: kexec: Fix potential buffer overflow in
> > >     prepare_elf_headers()
> > >   crash: Add crash_prepare_headers() to exclude crash kernel memory
> > >   arm64: kexec_file: Use crash_prepare_headers() helper to simplify c=
ode
> > >   x86/kexec: Use crash_prepare_headers() helper to simplify code
> > >   riscv: kexec_file: Use crash_prepare_headers() helper to simplify c=
ode
> > >   LoongArch: kexec: Use crash_prepare_headers() helper to simplify co=
de
> > >   crash: Use crash_exclude_core_ranges() on powerpc
> > >   arm64: kexec: Add support for crashkernel CMA reservation
> > >   riscv: kexec: Add support for crashkernel CMA reservation
> > >   arm64/crash: Add crash hotplug support
> > I have some bikesheedings about the subjects. Can we unify the prefix f=
ormats?
> > x86/kexec, arm64: kexec_file, riscv: kexec_file, LoongArch: kexec .....
>
> It might look weird in the series, but powerpc and x86 use '/' and arm64 =
and
> riscv use ':' so in the logs in arch/ this would be actually fine.
OK, but at least we can unify kexec and kexec_file.

Huacai

>
> With the only exception of arm64/crash that should have been arm64: crash=
:
>
> > Huacai
>
> --
> Sincerely yours,
> Mike.
