Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F05EC258ED4
	for <loongarch@lists.linux.dev>; Wed, 17 Sep 2025 07:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758094591; cv=none; b=fcMq/fmSJvK4j59YhZ8mogKA+PH1GxgdGNoeZ2ffXbwruwWeQN/qEt4sXmaYVczWjl0nOB8wx7DW7ZXs+QBGiocLSMNYLQDXBeOWLtCe3yhlFkXUmo3xQyEapKluL5e8XbMbwYhsIMYJuTnP3uf6+R9y/BxYrpFpMV53Vkm/0Fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758094591; c=relaxed/simple;
	bh=VAucuqdgzPyHd+g9DZ7+Ki+BQWK3AwrjXTrIUNryeEw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rBGKLXXJVEGIa9vxSmWMNgC0wjVVaIVF8QtWCScgPZK/GZfP8vIvwzlAPiDclOHd4E0lnRISV4i2aLQdOrr+BFalWzdWfvToin7iCmCreVk2Vohky+fGuk3UxZRYoDFKBQzTqyp+kv4gBzkwEKYMwgdCmQ40rHFE7qDxwlbIKqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tpO+4R5A; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tpO+4R5A"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C1C9C4CEF5
	for <loongarch@lists.linux.dev>; Wed, 17 Sep 2025 07:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758094590;
	bh=VAucuqdgzPyHd+g9DZ7+Ki+BQWK3AwrjXTrIUNryeEw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=tpO+4R5Ar738Fag068umbTa+k/UWIiYp9809DiU81E0jjMjHX9y0b5H265GtsgeoX
	 GwgVJjEcg/BoIrppF25umDMdxZQKc8oBieH6Ylu/zF8rEhr5PnnynnaG3QRG0jIzjA
	 lfKS1tT1rtQKzu8/q8KN10FmJXQdxgheY5drQDXfOCYWkKZ2gcjjU2E5EUf8HHbswl
	 HWNnn9fdscJED7bcZxQMPWMUlkz5XR01k2nj0NPsEpIU+pIbqvvPfmqTmHpfNWZpO3
	 YJz2HF1+GwSM/rPUGL6rk125z2CVxy1zN9Ej6P48JdzUIjG2bchIaBChTnLEX3f4YU
	 xCvdpqplp5+0w==
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b0aaa7ea90fso365378766b.1
        for <loongarch@lists.linux.dev>; Wed, 17 Sep 2025 00:36:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW9G5Rs7tztXYrCx7XV0lj7Qb6/FmDkznshpJv99lo7yRWw0rLnm971QcLkWC6572+YPXcc1wpAFGY=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz6D/jLbVj3CIoQO4nkNryOFtywpdHHshU57vre4SqE57pLFVFf
	oqIm7KTtazXfbJh13KoOlUR4OC3Zdgy9WYuQ7uDfEGhmevSZdj1YON8cA6HFF5Wc8ArcUslgp54
	3ZvXF1jH6nR9AWYiHO4HTtbQkrSSIVqo=
X-Google-Smtp-Source: AGHT+IGNvi3gBNur4pz9m0IhJ5PkvmAPvrqMb+ut5Eh7apZcJqSGRAvZSPqJ8bJL4y0nbxYSZ05uhC3ZAvqdojTiMEo=
X-Received: by 2002:a17:907:7e92:b0:b11:81ca:cf19 with SMTP id
 a640c23a62f3a-b1bb8ca6062mr137921966b.36.1758094589157; Wed, 17 Sep 2025
 00:36:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250917011007.4540-1-yangtiezhu@loongson.cn> <20250917011007.4540-3-yangtiezhu@loongson.cn>
 <CAAhV-H6L6nSuDxn_8cpexmSdLjO6DLLG0+9faPdhuD9iFMfdVw@mail.gmail.com> <21f7af56-5ec8-2922-3f19-ab1085238aec@loongson.cn>
In-Reply-To: <21f7af56-5ec8-2922-3f19-ab1085238aec@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Wed, 17 Sep 2025 15:36:15 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6=EHipeibEauhJF1tzKVWjue--MYzF0GtAPTC7txMjqw@mail.gmail.com>
X-Gm-Features: AS18NWC0WJBv295csTFTEuZgtxGqyDxWFZB5gom61a_aZRnAhP5sBAAwxM_17Vc
Message-ID: <CAAhV-H6=EHipeibEauhJF1tzKVWjue--MYzF0GtAPTC7txMjqw@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] objtool/LoongArch: Fix unreachable instruction
 warnings about image header
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, Peter Zijlstra <peterz@infradead.org>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 17, 2025 at 3:23=E2=80=AFPM Tiezhu Yang <yangtiezhu@loongson.cn=
> wrote:
>
> On 2025/9/17 =E4=B8=8B=E5=8D=883:04, Huacai Chen wrote:
> > Hi, Tiezhu,
> >
> > Patch-2 and Patch-3 can be squashed.
>
> OK, no problem.
And remove the objtool in the subject line because it doesn't modify
the objtool code.

Huacai

>
> Thanks,
> Tiezhu
>
>
