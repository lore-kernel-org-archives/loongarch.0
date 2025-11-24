Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 555312D8792
	for <loongarch@lists.linux.dev>; Mon, 24 Nov 2025 06:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763965905; cv=none; b=QLjClOiuwPnqf/5dcbBnMDisUWg1CpXFPgCE6eiLHdA2yJoRtVzFlDYvuOCp8PWbk7TdQ9aczyP1GvlYmQqF4rGdzzYLNrXP7/meTLsx0KhN3tMJDlp0hx9hukmkYl+NXH+8DNH9ceb627CCDZH0ckFASdnBclNX0pSpLuPDRvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763965905; c=relaxed/simple;
	bh=sGyvSEFKuUipVV3r8EtUpTG4/E8t2HegXvfjy1VxjeE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Jj3vSlRbNg98UVp20J2FTXlMVbbS+zP3iU+W253AZc077N723zS5oPYOWhY3sQK3sqX1mr56O1j5R5jEGQDec5smjQ8YVEY7KfBXDQDKGuG50LEVdVDM24wSvjA4/2/4lJbJ76BTrXlizKpiOE02o65eHxEWys/Rm7zM3Xmsksg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fJCohU3C; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fJCohU3C"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE6E6C19422
	for <loongarch@lists.linux.dev>; Mon, 24 Nov 2025 06:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763965905;
	bh=sGyvSEFKuUipVV3r8EtUpTG4/E8t2HegXvfjy1VxjeE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=fJCohU3Cd2BPjq7RaXdT5Tua3YUCqmQMQAjwbTyyPjqvuafDJcpMUSOOEjytw2qOL
	 RUgxLoEORNKAYoLqOOqPGW3dzzDtWR7Ab0yR+b6Ym18yVO3Ka7RSZF+L5nJ5UBNOkV
	 V2UX/pdi4+1nkmzn4bkjiJ95n4OLJpJ+zgu6SUK2+eLH+I37KlkEwxXrBzG37eU+9V
	 mEaAArb7AJBrkyhS+dY5WpDWKlqs+CRsWVNC+04usGqyxrDbhG2ldY6ifLDCEVgtO+
	 tJH04O0nuom+mEKIdE/jyfYVAzt0Po1jY8ziKgRYU/ukBND0Ic/Vj3Ym7k6M8DFACJ
	 BfdcU7rh6li5Q==
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-644f90587e5so6019106a12.0
        for <loongarch@lists.linux.dev>; Sun, 23 Nov 2025 22:31:44 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWGnhqmcRqoFlnAsCD7sMI9uu9hWNpdDaoOrzoj71slalTC30bsWWEOsDnzfIpvFv+dBXCCr+RkYtY=@lists.linux.dev
X-Gm-Message-State: AOJu0YxfaQ6f2goWyKLuEcrXvOG2hLa3zM1dP1zsSfb7maQWSuszLNRy
	s7WdHksTrY34o3MU+lcQaXrOmrT0AevP9oROfeRQl313mj9U49lWijXBXD2fRAgX5aoWducoOp5
	IT4qNKevGFba8yKzST8QnsOFgDiIbvzw=
X-Google-Smtp-Source: AGHT+IGLqLdyKiGKQHNqPpUfqYX69byCrZmT4BykpYmcTrIep7VYRAPnySV9z3Xw4anqcwzjFtMjTE+LTjIhIZnG3FU=
X-Received: by 2002:a17:906:c14a:b0:b6d:3a00:983a with SMTP id
 a640c23a62f3a-b7671709c17mr1195800566b.38.1763965903418; Sun, 23 Nov 2025
 22:31:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251124055642.1591-1-hengqi.chen@gmail.com>
In-Reply-To: <20251124055642.1591-1-hengqi.chen@gmail.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Mon, 24 Nov 2025 14:31:46 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6rrpgBF+bMpEvsJyq0F7sdWisGSwTbuf=ZBhi4XD-5jw@mail.gmail.com>
X-Gm-Features: AWmQ_blcU2NflMN8w5E7TIrrM_UekKDZkpWwVp9CJi-SmAxxi4qtayTzHlLw64c
Message-ID: <CAAhV-H6rrpgBF+bMpEvsJyq0F7sdWisGSwTbuf=ZBhi4XD-5jw@mail.gmail.com>
Subject: Re: [PATCH 0/5] LoongArch: BPF features and fixes
To: Hengqi Chen <hengqi.chen@gmail.com>
Cc: yangtiezhu@loongson.cn, vincent.mc.li@gmail.com, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Hengqi,

I think this is the successor of
https://lore.kernel.org/loongarch/20251006053323.193581-1-hengqi.chen@gmail=
.com/T/#t

Right?


Huacai

On Mon, Nov 24, 2025 at 1:56=E2=80=AFPM Hengqi Chen <hengqi.chen@gmail.com>=
 wrote:
>
> This small set implement new features with 2 bug fixes for BPF.
>
> * Patch 1 fixes a bug discovered while testing the BPF Arena feature.
>   Without this fix, the arena_htab test case which use the
>   bpf_arena_alloc_pages kfunc will trigger a kernel panic.
> * Patch 2 fixes a subtle bug for tail call index, this can be verified
>   by the verifier_runtime_jit test case.
>   See the following two threads for background:
>     - https://lore.kernel.org/bpf/CAEyhmHTvj4cDRfu1FXSEXmdCqyWfs3ehw5gtB9=
qJCrThuUy2Kw@mail.gmail.com/
>     - https://lore.kernel.org/bpf/20251005103518.996383-1-luis.gerhorst@f=
au.de/
> * Patch 3 uses pack allocator for BPF programs (BPF trampoline already
>   use pack allocator, this make it complete), with this, no regression
>   on existing selftests
> * Patch 4 & 5 implements basic support for BPF Arena, the following
>   test cases passed:
>     - arena_htab
>     - arena_list
>     - verifier_arena
>     - verifier_arena_large
>
> Hengqi Chen (5):
>   LoongArch: BPF: Sign extend kfunc call arguments
>   LoongArch: BPF: Zero-extend bpf_tail_call() index
>   LoongArch: BPF: Use BPF prog pack allocator
>   LoongArch: BPF: Implement PROBE_MEM32 pseudo instructions
>   LoongArch: BPF: Implement bpf_addr_space_cast instruction
>
>  arch/loongarch/net/bpf_jit.c | 225 ++++++++++++++++++++++++++++-------
>  arch/loongarch/net/bpf_jit.h |  30 ++++-
>  2 files changed, 213 insertions(+), 42 deletions(-)
>
> --
> 2.43.5
