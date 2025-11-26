Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6339221FF46
	for <loongarch@lists.linux.dev>; Wed, 26 Nov 2025 07:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764140953; cv=none; b=D44khfhp+RaOYXaSLpAum2pgZWvjMy8ZflOTY4C8aVZUfW6o3L9E97KYgeveM/KVeG0DtTQ0b1ljFeE2uQqRSnNsRi610BR3ZBPerCr4MvLyGehHeWyAeD1QXVWkG40VH2vasC14dgHcGJoKIui3LjfUzUiEWxBbuyU1dcrMc4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764140953; c=relaxed/simple;
	bh=D81/U/r4ll/aJ46lwh5MjYT3sLwCXZh8GWYMYdx8Iik=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ig2L1ctbne1Wd8ElePy9eNPmem7OEW25vYFsaT4YG2Gzf+Eff662J1aX++lp5AEMpGfJyfLA9HhlXZ2EPHV4m0F8CQJlEfFFjxU5Q3cbbcgGbduWWEqmVMZza/uVObB31loh6uigrYJ0ToZMgSeUoc9UpHNbQtTfMefylBSo3DU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nEXTSbGe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nEXTSbGe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45879C16AAE
	for <loongarch@lists.linux.dev>; Wed, 26 Nov 2025 07:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764140953;
	bh=D81/U/r4ll/aJ46lwh5MjYT3sLwCXZh8GWYMYdx8Iik=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=nEXTSbGeDR/PNHwycuEXDvsQtIzib3DmjE1YTWaFbECGm6T7hbOtTTvN2vdEkHMA7
	 y5ASpjG+Inutm84t5SsyznW1QsoQGGaIXMgcvDzROkKZJKXQGHxURqGY7AZC8/5E62
	 xAgQtq94e5a80U9iJi6jucG7+RwMx5fH2eO8CW6U5Zfd0Opt9cB4+geruS5irDG5lA
	 +xJnuLsJl+1PHntNpF9VzxWJzrBq6UL/6v++1I5fKiDuNjL2ogK759WIdqC+9g81qp
	 4DbqdWoo7Lim2P5nfFHVh8+lA3gFJtEL+oJxLW0zffKdFnANNPGbunEQSmyLucb+Ux
	 8k5iL9P3+zedg==
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6408f9cb1dcso2958883a12.3
        for <loongarch@lists.linux.dev>; Tue, 25 Nov 2025 23:09:13 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWBq0HghLxSBVjcteS0yUuAd1tU7MnUtDFAoeDhUEN2Ue2LCjjZIeF/hjXXmZ7Wq6/WHXQn5pu8y80=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw4bEBm8eUbSWU8gA0bAroNdVpdQlb3XpHOceFLwu22EGrgm6qK
	yjW9V9IkFdz0R3JHIq/71qZUuIkkvPn1lBpFHbYa9lB9miBtrunfxJ+AKD59UYzRgTok4c9dWnO
	oVYZgEm63PouSZd6ttk/U+e+3tF7hkwA=
X-Google-Smtp-Source: AGHT+IEntSPkO8+ZDsOZT/nZua3PcaJiN8EYEyx0cfSy5NAMd+3VAXax17CQGCTirCAERp+Sb04uM2EZvGmVHYdfG/A=
X-Received: by 2002:a17:907:7f1b:b0:b4f:e12e:aa24 with SMTP id
 a640c23a62f3a-b76c53c3547mr535421866b.22.1764140951808; Tue, 25 Nov 2025
 23:09:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251125082559.488612-1-chenhuacai@loongson.cn> <9c732952-2ff6-4672-ab9a-76ac8590bf88@app.fastmail.com>
In-Reply-To: <9c732952-2ff6-4672-ab9a-76ac8590bf88@app.fastmail.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Wed, 26 Nov 2025 15:09:16 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5m=oowvFLwbZKMDvWp3qPKCmKp5uoS4WU1XsAWzwWMmQ@mail.gmail.com>
X-Gm-Features: AWmQ_bk2gFzHkiCRAud-nVJQutbl2f7pk_UGKmDfKWV0Eqt6hPQydltN7smjh_I
Message-ID: <CAAhV-H5m=oowvFLwbZKMDvWp3qPKCmKp5uoS4WU1XsAWzwWMmQ@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: Fix build errors for CONFIG_RANDSTRUCT
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Huacai Chen <chenhuacai@loongson.cn>, loongarch@lists.linux.dev, 
	Xuefeng Li <lixuefeng@loongson.cn>, Guo Ren <guoren@kernel.org>, 
	Xuerui Wang <kernel@xen0n.name>, linux-kernel@vger.kernel.org, 
	"stable@vger.kernel.org" <stable@vger.kernel.org>, kernel test robot <lkp@intel.com>, Rui Wang <wangrui@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 25, 2025 at 9:49=E2=80=AFPM Jiaxun Yang <jiaxun.yang@flygoat.co=
m> wrote:
>
>
>
> On Tue, 25 Nov 2025, at 4:25 PM, Huacai Chen wrote:
> > When CONFIG_RANDSTRUCT enabled, members of task_struct are randomized.
> > There is a chance that TASK_STACK_CANARY be out of 12bit immediate's
> > range and causes build errors. TASK_STACK_CANARY is naturally aligned,
> > so fix it by replacing ld.d/st.d with ldptr.d/stptr.d which have 14bit
> > immediates.
>
> Hi Huacai,
>
> What about 32bit build in this case?
Use the same solution as other registers, please see:
https://lore.kernel.org/loongarch/20251122043634.3447854-7-chenhuacai@loong=
son.cn/T/#u

Huacai

>
> Thanks
> Jiaxun
>
> >
