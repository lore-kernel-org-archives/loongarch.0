Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5A692C859;
	Fri, 20 Dec 2024 10:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734690672; cv=none; b=WL/cGDPE2pWyk/cWtNCpg6xkMlTlYWg0Nu0OAGjfTQBY9UMO1N9fji2ShRAEjKJESspK/+Fuz1NdLDCv0fD5taJ7jgnfzj2HYfsd5EQ18Q+C1qZEW/IZnZTXnxkk79YGhbQOzl6OBOp69DQ3r+lVsCgE0cSPgJA8MUk9ia8t1js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734690672; c=relaxed/simple;
	bh=4bbG1+QjNCHdJGpSyCOK4S81Wn8RdxR6wKvfugfbHH8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bnIP3Y4E0dQH9ZTs+V+zFhT+u6rjDtuEjdRnQuqXGAmRZoFYLKjocHM1tjOhgZNTQ1zG0MMMTc+9v3CooFHkPHBOKhu4ifNXne/HWMwvS2qxx9+5lpPj2f05WZukHiIRoDOfQFsULPnepiaetrF5fBKpUT8CLQ/xlYqjiK8wOMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=g+cG5POY; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="g+cG5POY"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=nMeZGQ+3kWPIPYP6wpoaQAymOrYo8lqxNQuWkBMJcVE=; b=g+cG5POYdEgx3EfUeE3AxWzMcT
	GjYFC2para1RsxL8TpfbSBOd2O9ufLidLrYN5s2MxZa1qm26WycSTu/BkZvjbc2zeTMdZNNOAdPdk
	UE5dJfu1RTkL6Q4oGSZaZEtxLSo0si4SObhQ4dV2ged36zt6wXGOP0TN0IHibnzLslhELd/fx00/O
	K8nkxx60b6Q/BjFs3BItwfv67xOp76nU9dVCtcyH8ff4ImSxFmrOoq041fHef2t6WKjsGP2vpAb6O
	7m895gTjOufnY8vK/Nrd/wNIFhCuVPdsr8QUI2kl3TXZ4/i7deWOtRGuXMl67h8hGSgHrM2AkzcBt
	v0CMzxtQ==;
Received: from 77-249-17-89.cable.dynamic.v4.ziggo.nl ([77.249.17.89] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tOaHc-00000000BBw-23nM;
	Fri, 20 Dec 2024 10:31:00 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 3B6FD3003FF; Fri, 20 Dec 2024 11:31:00 +0100 (CET)
Date: Fri, 20 Dec 2024 11:31:00 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: Alex Deucher <alexdeucher@gmail.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev,
	amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	Nick Desaulniers <ndesaulniers@google.com>, nathan@kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH v6 9/9] drm/amd/display: Mark dc_fixpt_from_fraction()
 noinline
Message-ID: <20241220103100.GB17537@noisy.programming.kicks-ass.net>
References: <20241217010905.13054-1-yangtiezhu@loongson.cn>
 <20241217015006.30305-1-yangtiezhu@loongson.cn>
 <CAAhV-H4WpcWjrQdkm3Sx4DVbp=2oW9nNGAbNqR4BEmiryrptNQ@mail.gmail.com>
 <20241218190558.g2hykmjgbny4n5i3@jpoimboe>
 <CADnq5_PFcHzob4poLa86_K4yP5gUT7Ei4Rz5vSUofvZTmB48-g@mail.gmail.com>
 <4bace457-cc26-13a3-bc90-ad6ad12bc2ed@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4bace457-cc26-13a3-bc90-ad6ad12bc2ed@loongson.cn>

On Fri, Dec 20, 2024 at 01:02:18PM +0800, Tiezhu Yang wrote:

> 2. For x86
> 
> I tested with LLVM 19.1.6 and the latest mainline LLVM, the test result
> is same with LoongArch.

Debian's clang-19 is 19.1.5.

> (1) objdump info with LLVM release version 19.1.6:

Please always use -r, that's ever so much more readable.

> $ clang --version | head -1
> clang version 19.1.6
> 
> There is an jump instruction "jmp" at the end of dc_fixpt_recip(), it
> maybe jumps to a position and then steps to the return instruction, so
> there is no "falls through" objtool warning.
> 
> 0000000000000290 <dc_fixpt_recip>:
>      290:       f3 0f 1e fa             endbr64
>      294:       e8 00 00 00 00          call   299 <dc_fixpt_recip+0x9>
>      299:       48 85 ff                test   %rdi,%rdi
>      29c:       0f 84 a8 00 00 00       je     34a <dc_fixpt_recip+0xba>
>      2a2:       48 89 f9                mov    %rdi,%rcx
>      2a5:       48 f7 d9                neg    %rcx
>      2a8:       48 0f 48 cf             cmovs  %rdi,%rcx
>      2ac:       53                      push   %rbx
>      2ad:       48 b8 00 00 00 00 01    movabs $0x100000000,%rax
>      2b4:       00 00 00
>      2b7:       31 d2                   xor    %edx,%edx
>      2b9:       48 f7 f1                div    %rcx
>      2bc:       be e0 ff ff ff          mov    $0xffffffe0,%esi
>      2c1:       eb 1b                   jmp    2de <dc_fixpt_recip+0x4e>
>      2c3:       45 88 c8                mov    %r9b,%r8b
>      2c6:       4d 01 c0                add    %r8,%r8
>      2c9:       4d 8d 04 80             lea    (%r8,%rax,4),%r8
>      2cd:       48 29 da                sub    %rbx,%rdx
>      2d0:       45 88 da                mov    %r11b,%r10b
>      2d3:       4c 89 d0                mov    %r10,%rax
>      2d6:       4c 09 c0                or     %r8,%rax
>      2d9:       83 c6 02                add    $0x2,%esi
>      2dc:       74 31                   je     30f <dc_fixpt_recip+0x7f>
>      2de:       48 01 d2                add    %rdx,%rdx
>      2e1:       45 31 c0                xor    %r8d,%r8d
>      2e4:       41 ba 00 00 00 00       mov    $0x0,%r10d
>      2ea:       48 39 ca                cmp    %rcx,%rdx
>      2ed:       41 0f 93 c1             setae  %r9b
>      2f1:       72 03                   jb     2f6 <dc_fixpt_recip+0x66>
>      2f3:       49 89 ca                mov    %rcx,%r10
>      2f6:       4c 29 d2                sub    %r10,%rdx
>      2f9:       48 01 d2                add    %rdx,%rdx
>      2fc:       45 31 d2                xor    %r10d,%r10d
>      2ff:       48 89 cb                mov    %rcx,%rbx
>      302:       48 39 ca                cmp    %rcx,%rdx
>      305:       41 0f 93 c3             setae  %r11b
>      309:       73 b8                   jae    2c3 <dc_fixpt_recip+0x33>
>      30b:       31 db                   xor    %ebx,%ebx
>      30d:       eb b4                   jmp    2c3 <dc_fixpt_recip+0x33>
>      30f:       48 01 d2                add    %rdx,%rdx
>      312:       48 be fe ff ff ff ff    movabs $0x7ffffffffffffffe,%rsi
>      319:       ff ff 7f
>      31c:       4c 8d 46 01             lea    0x1(%rsi),%r8
>      320:       48 39 ca                cmp    %rcx,%rdx
>      323:       4c 0f 43 c6             cmovae %rsi,%r8
>      327:       4c 39 c0                cmp    %r8,%rax
>      32a:       77 29                   ja     355 <dc_fixpt_recip+0xc5>
>      32c:       48 39 ca                cmp    %rcx,%rdx
>      32f:       48 83 d8 ff             sbb    $0xffffffffffffffff,%rax
>      333:       48 89 c1                mov    %rax,%rcx
>      336:       48 f7 d9                neg    %rcx
>      339:       48 85 ff                test   %rdi,%rdi
>      33c:       48 0f 49 c8             cmovns %rax,%rcx
>      340:       48 89 c8                mov    %rcx,%rax
>      343:       5b                      pop    %rbx
>      344:       2e e9 00 00 00 00       cs jmp 34a <dc_fixpt_recip+0xba>
>      34a:       0f 0b                   ud2
>      34c:       0f 0b                   ud2
>      34e:       31 c9                   xor    %ecx,%ecx
>      350:       e9 57 ff ff ff          jmp    2ac <dc_fixpt_recip+0x1c>
>      355:       0f 0b                   ud2
>      357:       eb d3                   jmp    32c <dc_fixpt_recip+0x9c>
>      359:       0f 1f 80 00 00 00 00    nopl   0x0(%rax)

I had to puzzle a bit to get that double ud2 -- not all configs do that.

Also, curse the DRM Makefiles, you can't do:

  make drivers/gpu/drm/amd/display/dc/basics/fixpt31_32.s

:-(

They are the two ASSERT()s on line 217 and 54 respectively. They end up
asserting the same value twice, so that makes sense.

> $ clang --version | head -1
> clang version 20.0.0git (https://github.com/llvm/llvm-project.git
> 8daf4f16fa08b5d876e98108721dd1743a360326)

So I didn't have a recent build at hand.. so I've not validated the
below.

> There is "ud2" instruction at the end of dc_fixpt_recip(), its offset
> is "350", this "ud2" instruction is not dead end due to the offset "352"
> is in the relocation section '.rela.discard.reachable', that is to say,
> dc_fixpt_recip() doesn't end with a return instruction or an
> unconditional jump, so objtool determined that the function can fall
> through into the next function, thus there is "falls through" objtool
> warning.
> 
> 0000000000000290 <dc_fixpt_recip>:
>      290:       f3 0f 1e fa             endbr64
>      294:       e8 00 00 00 00          call   299 <dc_fixpt_recip+0x9>
>      299:       48 85 ff                test   %rdi,%rdi
>      29c:       0f 84 ac 00 00 00       je     34e <dc_fixpt_recip+0xbe>
>      2a2:       53                      push   %rbx
>      2a3:       48 89 f9                mov    %rdi,%rcx
>      2a6:       48 f7 d9                neg    %rcx
>      2a9:       48 0f 48 cf             cmovs  %rdi,%rcx
>      2ad:       48 b8 00 00 00 00 01    movabs $0x100000000,%rax
>      2b4:       00 00 00
>      2b7:       31 d2                   xor    %edx,%edx
>      2b9:       48 f7 f1                div    %rcx
>      2bc:       be e0 ff ff ff          mov    $0xffffffe0,%esi
>      2c1:       eb 1b                   jmp    2de <dc_fixpt_recip+0x4e>
>      2c3:       45 88 c8                mov    %r9b,%r8b
>      2c6:       4d 01 c0                add    %r8,%r8
>      2c9:       4d 8d 04 80             lea    (%r8,%rax,4),%r8
>      2cd:       48 29 da                sub    %rbx,%rdx
>      2d0:       45 88 da                mov    %r11b,%r10b
>      2d3:       4c 89 d0                mov    %r10,%rax
>      2d6:       4c 09 c0                or     %r8,%rax
>      2d9:       83 c6 02                add    $0x2,%esi
>      2dc:       74 31                   je     30f <dc_fixpt_recip+0x7f>
>      2de:       48 01 d2                add    %rdx,%rdx
>      2e1:       45 31 c0                xor    %r8d,%r8d
>      2e4:       41 ba 00 00 00 00       mov    $0x0,%r10d
>      2ea:       48 39 ca                cmp    %rcx,%rdx
>      2ed:       41 0f 93 c1             setae  %r9b
>      2f1:       72 03                   jb     2f6 <dc_fixpt_recip+0x66>
>      2f3:       49 89 ca                mov    %rcx,%r10
>      2f6:       4c 29 d2                sub    %r10,%rdx
>      2f9:       48 01 d2                add    %rdx,%rdx
>      2fc:       45 31 d2                xor    %r10d,%r10d
>      2ff:       48 89 cb                mov    %rcx,%rbx
>      302:       48 39 ca                cmp    %rcx,%rdx
>      305:       41 0f 93 c3             setae  %r11b
>      309:       73 b8                   jae    2c3 <dc_fixpt_recip+0x33>
>      30b:       31 db                   xor    %ebx,%ebx
>      30d:       eb b4                   jmp    2c3 <dc_fixpt_recip+0x33>
>      30f:       48 01 d2                add    %rdx,%rdx
>      312:       48 be fe ff ff ff ff    movabs $0x7ffffffffffffffe,%rsi
>      319:       ff ff 7f
>      31c:       4c 8d 46 01             lea    0x1(%rsi),%r8
>      320:       48 39 ca                cmp    %rcx,%rdx
>      323:       4c 0f 43 c6             cmovae %rsi,%r8
>      327:       4c 39 c0                cmp    %r8,%rax
>      32a:       77 1e                   ja     34a <dc_fixpt_recip+0xba>
>      32c:       48 39 ca                cmp    %rcx,%rdx
>      32f:       48 83 d8 ff             sbb    $0xffffffffffffffff,%rax
>      333:       48 89 c1                mov    %rax,%rcx
>      336:       48 f7 d9                neg    %rcx
>      339:       48 85 ff                test   %rdi,%rdi
>      33c:       48 0f 49 c8             cmovns %rax,%rcx
>      340:       48 89 c8                mov    %rcx,%rax
>      343:       5b                      pop    %rbx
>      344:       2e e9 00 00 00 00       cs jmp 34a <dc_fixpt_recip+0xba>
>      34a:       0f 0b                   ud2
>      34c:       eb de                   jmp    32c <dc_fixpt_recip+0x9c>
>      34e:       0f 0b                   ud2
>      350:       0f 0b                   ud2
>      352:       66 66 66 66 66 2e 0f    data16 data16 data16 data16 cs nopw
> 0x0(%rax,%rax,1)
>      359:       1f 84 00 00 00 00 00

If you put them size-by-side, you'll see it's more or less the same
code-gen (trivial differences), but now it just stops code-gen, where
previously it would continue.

So this really is a compiler problem, this needs no annotation, it's
straight up broken.

Now, the thing is, these ASSERT()s are checking for divide-by-zero, I
suspect clang figured that out and invokes UB on us and just stops
code-gen.

Nathan, Nick, don't we have a compiler flag that forces __builtin_trap()
whenever clang pulls something like this? I think UBSAN does this, but
we really shouldn't pull in the whole of that for sanity.

