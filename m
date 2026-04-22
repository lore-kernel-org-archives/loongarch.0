Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FEDC3AB293
	for <loongarch@lists.linux.dev>; Wed, 22 Apr 2026 08:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776845920; cv=none; b=EqPn2gF+4NMDSw35oGEyoh+t81i5oXlbTqerke6Gu9OlNEnFxU/lOGq8x2anmU4ARnmTHNB8FDVx/BaTGgjSREU2yGbsX8wsKmRcGyy0KVCpHi1uBJZkXN2SAf/+I9GTsEj1MP7bD9S+aSPAZ9esRo0ZGh16vBOoyzqV0mxQV8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776845920; c=relaxed/simple;
	bh=HcddeAEWuEGHuyRr3B6WH5YQSjCvNKPOS6zyBreHeFY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nxT17KT55J1APMqMpR5+8uyShQVqoLWGiEqVTG0YWK+/v5pLDTvJDNtoOdxuzvhqoaO6+Db3g9Xq2Cs7B+LBZS677szihng/DbFe8QJEAlTu5jv9FNHuxIi9cXyQ4zSvWDhyTFckkXpWkjoM+zWz1rKccXWJA1icMm5r7KV0fqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tjNhpkKO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tjNhpkKO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2882C2BCB3
	for <loongarch@lists.linux.dev>; Wed, 22 Apr 2026 08:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776845919;
	bh=HcddeAEWuEGHuyRr3B6WH5YQSjCvNKPOS6zyBreHeFY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=tjNhpkKO+HdnSIxGpzZ7RVyoMURCsKb7/GFpkPC7/6ODCxTlarWPrWkLqA0XRG6/+
	 EA7iV7s1qIsLYa+npU11I0GXvv8KJQ0uEb9QnOhu/9hrGjhT8SjEbjaFZzE9wONmoV
	 L4Eac4zSJ/7vjf7MKV/p2UT5kVY0YUjYW1o2kM1/6R16dNyiy6OHiUmHAeuklOEqQj
	 sDvUX7qEVY6H4v/l9RYG9Uuu7sQze0km1YbFgasl+pDc//gNxktJ77QD6mZcWNyWOU
	 f07S7eb1mL5AoTw6MNM5R5XWj5wM9wdv2uTmw5Eth9iB55riOvc18HGDUnf9f2S9rm
	 +VNM/opq5+ttA==
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-676f5a40cacso749660a12.2
        for <loongarch@lists.linux.dev>; Wed, 22 Apr 2026 01:18:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9Qr+Rb0ttTdtAO2vi8ih4rgyGR5xdCrX9nzNqgJQFYFqq1z39tF85h8Fe72mfU/HL3+xsPz87K3lI=@lists.linux.dev
X-Gm-Message-State: AOJu0YzmMTpO6CQtKn9msymuJAkWhQF9o6LV+1dfAZt6qGmepbkGQP03
	sAL0aglNzHxy2qsiDjQyYI5lQIRgHjIfigb3yhyGPU9B5CJreQtesP9yVQCExJX4LofPM5Scd6k
	kW8a8zNYjg47WX1urMSSgpHFGiRcYCDw=
X-Received: by 2002:a17:907:96a1:b0:ba9:2137:7165 with SMTP id
 a640c23a62f3a-ba92146ccc2mr443462866b.1.1776845918458; Wed, 22 Apr 2026
 01:18:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260226065952.4082859-1-hengqi.chen@gmail.com>
In-Reply-To: <20260226065952.4082859-1-hengqi.chen@gmail.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Wed, 22 Apr 2026 16:18:51 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7cUtAmmrMeDBCiUcwth7FtN6e9yGC8sC3DBMpYf60zGA@mail.gmail.com>
X-Gm-Features: AQROBzDN4WV-807C-KohUvohrH9WVcGaEsF-NaIkgakMTxmlsWOFKthsQuK3iJg
Message-ID: <CAAhV-H7cUtAmmrMeDBCiUcwth7FtN6e9yGC8sC3DBMpYf60zGA@mail.gmail.com>
Subject: Re: [PATCH 0/3] bpf: fsession support for LoongArch
To: Hengqi Chen <hengqi.chen@gmail.com>
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org, 
	martin.lau@linux.dev, yangtiezhu@loongson.cn, vincent.mc.li@gmail.com, 
	menglong8.dong@gmail.com, loongarch@lists.linux.dev, bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Hengqi,

On Thu, Feb 26, 2026 at 3:00=E2=80=AFPM Hengqi Chen <hengqi.chen@gmail.com>=
 wrote:
>
> This small set implements fsession support for LoongArch.
>
> Patch 1 introduces a helper named emit_store_stack_imm64().
> Patch 2 implements fsession support.
> Patch 3 enable fsession selftests on LoongArch.
I have applied Tiezhu's "LoongArch: BPF: Support more features for
trampoline" first, so please resend an updated version on top of:
https://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson.g=
it/log/?h=3Dloongarch-next

Huacai
>
> Hengqi Chen (3):
>   LoongArch: BPF: Introduce emit_store_stack_imm64() helper
>   LoongArch: BPF: Add fsession support for trampolines
>   bpf/selftests: Enable fsession tests for LoongArch
>
>  arch/loongarch/net/bpf_jit.c                  | 100 ++++++++++++++----
>  .../selftests/bpf/progs/get_func_args_test.c  |   3 +-
>  .../selftests/bpf/progs/get_func_ip_test.c    |   3 +-
>  3 files changed, 83 insertions(+), 23 deletions(-)
>
> --
> 2.43.5
>
