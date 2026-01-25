Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0067721B9DA
	for <loongarch@lists.linux.dev>; Sun, 25 Jan 2026 04:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769314247; cv=none; b=KC0qqAtFl76cJtv7h/+xwxft3s3j71+bFwKMTE077+KNgdfuEINwcz3UyzlEthSB1Ex67hpX+L26T4K6L4UHu/Nd2wwfjGlyfnNVyy/J2rtDzCsS4fk0ZrSiuhaAa1t7qSG0WyE7hAXW5CIlYC5/kJhrqFI14WbEhJ18kxBPcHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769314247; c=relaxed/simple;
	bh=l50ndhZ3FXc+QnBgtWTJvvA549cwCI1OK+sbnoxRLsg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MmCqiqp3iH7LpPdXeZMdPHi0922vuwQyXG4tocyfrfAvciRnTYlVPO3DqhGf2++YG8RjWHkRZtNHfqch7CVyTY3gXXaslvG3NZlz/ubWk5VIwzCPjLpig3MZyyXL3YEnpIt/zVWh2mb6f1+bRPG1lK86fqDS7jX5lifFpCKrD+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uERinU2w; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uERinU2w"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97B7AC4AF09
	for <loongarch@lists.linux.dev>; Sun, 25 Jan 2026 04:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769314246;
	bh=l50ndhZ3FXc+QnBgtWTJvvA549cwCI1OK+sbnoxRLsg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=uERinU2wkuFgO8aalXVouUEx/BYp0tzdsdkoGysKPpbgBbgQFi1ja3YMiu+FP0OQW
	 TcRAtJ+tWXDibwPamp5/e6kg14J+D5wOqs0E4WUdIEmbjXrHC9gNWJXlTJokNgqloL
	 3SZOa9iW1jTU7JO3WPZvdSyFVYGKpLeZiA+sh4Eejq1lxw/RAf/C93TdsjViqm67tC
	 pCbeKdFVSUxRXx4Wi6U8PFNRgL91hbCAr1lp8se0YVvkRlaqpKoCQZ/RmYgdhiqBfy
	 X81dPp1DVJqSwuq3ahsIwyMAu5xqZ1/qFoILr170bp8+VS/fA9sLELUbj74UeX/aUC
	 aqOYI4XGkwR/Q==
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b8842e5a2a1so443041666b.2
        for <loongarch@lists.linux.dev>; Sat, 24 Jan 2026 20:10:46 -0800 (PST)
X-Gm-Message-State: AOJu0YxwJ438bDyyWu7A/23OIs6AdIXY//88JmmyQKafV38DiMwhysMb
	wRg6KPzYQAl88iAGOMpcYif+MBdfJb/xzHK5G+kbBFP+vHvXQ8TdP+zaFuWBQqEh8W8i3SK7Xj/
	DKATpsow0zlcQqoJZF5aWG570Bhda/1c=
X-Received: by 2002:a17:907:96a5:b0:b73:398c:c5a7 with SMTP id
 a640c23a62f3a-b8d4f70ce43mr35505666b.41.1769314245231; Sat, 24 Jan 2026
 20:10:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260121095911.20868-1-yangtiezhu@loongson.cn>
In-Reply-To: <20260121095911.20868-1-yangtiezhu@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sun, 25 Jan 2026 12:10:41 +0800
X-Gmail-Original-Message-ID: <CAAhV-H46DqEp7sCS+5yNfY9XoSj6_W4-DSDYUFjUdxZ83Ud+7g@mail.gmail.com>
X-Gm-Features: AZwV_QgoVwmD4M9zwAOeTCRJ3WKOYtmsZgogN_9b5EFEsRSLGaxrdzLxYwe6gH4
Message-ID: <CAAhV-H46DqEp7sCS+5yNfY9XoSj6_W4-DSDYUFjUdxZ83Ud+7g@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] LoongArch: Fix errors about "cannot find unwind pc"
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied, thanks.

Huacai

On Wed, Jan 21, 2026 at 5:59=E2=80=AFPM Tiezhu Yang <yangtiezhu@loongson.cn=
> wrote:
>
> This series is based on 6.19-rc6, tested on Loongson-3A6000.
>
> Tiezhu Yang (4):
>   LoongArch: Use %px to print unmodified unwinding address
>   LoongArch: Handle percpu handler address for ORC unwinder
>   LoongArch: Guard percpu handler under !CONFIG_PREEMPT_RT
>   LoongArch: Remove some extern variables in source files
>
>  arch/loongarch/include/asm/setup.h      |  2 ++
>  arch/loongarch/kernel/unwind_orc.c      | 18 ++++++++++++++++--
>  arch/loongarch/kernel/unwind_prologue.c |  6 +-----
>  arch/loongarch/mm/tlb.c                 |  1 -
>  4 files changed, 19 insertions(+), 8 deletions(-)
>
> --
> 2.42.0
>
