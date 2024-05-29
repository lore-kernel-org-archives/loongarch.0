Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25BC428F3
	for <loongarch@lists.linux.dev>; Wed, 29 May 2024 01:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716947687; cv=none; b=p3if6rUaCRaU746q6PFc4a64Vg64ehWbT/1Dfg5l+bZfHrAH2zWHZzwQgFcy59G7qk8tAFAzeNxXHgURgC0o5OCi5SmS6IIatOYeXnSioSLpqb4RNHPq6ZhoYQRfqsHZWwM+qf8XhIKPgMhaUrkf6LMGjqJOAB215MTFF72MbUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716947687; c=relaxed/simple;
	bh=nonYj+5J+55UvG2PRdGpmNDgp1YIF/NT96nwHobE7pc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=An3tXjrozc0CrubgIuvJnfVnFpLSO+G+92fmEOMaCdkN4d0ujRCBY42wLw7WY+j23vkwBvH/Jxtf+H8tjNZqqzUbFfv6lPmNYI95hU8/NaX/FMaD99jtNK9fDK3rrMWbGT/LopykAiIlUWDWRhNB8dkLSg1OIfyiwwZ5S2Tsf9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q9K8Jyq9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q9K8Jyq9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DAB5C4AF08
	for <loongarch@lists.linux.dev>; Wed, 29 May 2024 01:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716947686;
	bh=nonYj+5J+55UvG2PRdGpmNDgp1YIF/NT96nwHobE7pc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Q9K8Jyq9YHSOVA7FFykKxnb2vvqQf7dp6vG27H7/vd9ZAVIe+/xOdqPVbxiYnYq8H
	 R12b4OLvufamcm5ekJjScnERCDv+MrmZ1apTZLYcPdQKuI0Jk2TNDKeA/Byw0+5/l2
	 S+8NRXCw/jIaYKkpMvW3PNvbdGKfo//mVMi7dDXqEXi+Lbu7829LhSKiuDWALog+zz
	 MFIChBfAbrUKUpLDWTJMNnBJov24wZvHrcV0t8aNfJQAKEMZuZrGrR+XLJ3bnMm5r+
	 MdoGCSm9lRT6cutdir8WLZUyxCyrUOXJSYUd6e01p/FX5NGgZyk2aJS7GCcDr/PI6I
	 Xb9nk/yAMtvCg==
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a5a89787ea4so159641366b.2
        for <loongarch@lists.linux.dev>; Tue, 28 May 2024 18:54:46 -0700 (PDT)
X-Gm-Message-State: AOJu0Yxu/Yd0kU9SyXRyXYdY6BC5dt4LkXo3DB/G9r4A5PWU44zZwlYR
	wkEy79szzcaW8mAz7N8WduQ+IgttoiLx4ABbSdtK1DvxUSMKuqzdokOY/HuscRjbCbQXBHFGd1d
	S9jIb4ItOsEguXL0iosZ+UErDLrc=
X-Google-Smtp-Source: AGHT+IHmW06yTOBMHq2zdJgFsebrCjzVaYydR+yPBubQSuwPx2P0iebesriTc5GKPauWomrFT94WD+JzV0gJ7a0bL8o=
X-Received: by 2002:a17:906:5801:b0:a59:aa68:99a0 with SMTP id
 a640c23a62f3a-a62642e92a0mr818025766b.18.1716947685181; Tue, 28 May 2024
 18:54:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240529013019.15235-1-lihui@loongson.cn>
In-Reply-To: <20240529013019.15235-1-lihui@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Wed, 29 May 2024 09:54:33 +0800
X-Gmail-Original-Message-ID: <CAAhV-H544FpqOpVZ_J--dmHRcT=7YNL2aavwTDnE1fQQ6HK_qQ@mail.gmail.com>
Message-ID: <CAAhV-H544FpqOpVZ_J--dmHRcT=7YNL2aavwTDnE1fQQ6HK_qQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] LoongArch: ptrace: Fix some watchpoint function
To: Hui Li <lihui@loongson.cn>, diasyzhang@tencent.com, 
	Jinyang He <hejinyang@loongson.cn>, Binbin Zhou <zhoubinbin@loongson.cn>
Cc: loongarch@lists.linux.dev, loongson-kernel@lists.loongnix.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Qing and Jinyang,

Could you please help to review this patchset?

And Binbin,

Could you please help to test kgdb with this patchset?

Thank you,
Huacai


On Wed, May 29, 2024 at 9:30=E2=80=AFAM Hui Li <lihui@loongson.cn> wrote:
>
> LoongArch defines hardware watchpoint functions for fetch and load/store
> operations. After the software configures the watchpoints for fetch and
> load/store, the processor hardware will monitor the access addresses of
> the fetch and load/store operations and trigger a watchpoint exception
> when the watchpoint setting conditions are met.
>
> Fix some hardware watchpoint issues on user-space and kernel interface.
>
> All changes are made according to the LoongArch Reference Manual:
> https://loongson.github.io/LoongArch-Documentation/LoongArch-Vol1-EN.html=
#control-and-status-registers-related-to-watchpoints
>
> Testing for this series can use this gdb patch:
> https://sourceware.org/pipermail/gdb-patches/2024-May/209371.html
>
>
> Hui Li (3):
>   LoongArch: ptrace: Fix watchpoint setting error
>   LoongArch: Trigger user-space watchpoints correctly
>   LoongArch: Fix multiple hardware watchpoint issues
>
>  arch/loongarch/include/asm/hw_breakpoint.h |  2 +-
>  arch/loongarch/kernel/hw_breakpoint.c      | 82 +++++++++++-----------
>  arch/loongarch/kernel/ptrace.c             | 48 +++++++------
>  3 files changed, 71 insertions(+), 61 deletions(-)
>
> --
> 2.38.1
>
>
