Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB17437FF57
	for <loongarch@lists.linux.dev>; Thu,  9 Apr 2026 12:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775738019; cv=none; b=KYmZrWYdOQP14McxyLl3B7ahR0uQc527yk3u1Fb8NoFyWsWbwpo9QC4Dc6GxgDs86oZ1CJqR0sY3b6397/+CvFykN/mX/yX7AHx0xWwmPrMqDJWFxZUYTMo84dMufkuMKwINg8ATzkJ0oJ25js+HElDLidJcu3l1qjbkyx0OoSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775738019; c=relaxed/simple;
	bh=dZhY8zCfUZtD/49b1gW38xFYGfUfE4+bIqm7BrGAsjw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PPvqqOs9HsliBBUiDDiY2inMUB+LsesCDJesbO3s2cPdR60CxdXMITK8bRSUdKwwtEwOSO5ueydR5vC3RPeF5guEgMH6AgbU+KkUgZyp5FuHbmZAcGo8zNVtIq5FQL4+Xbv3+yEiZMcdknxFp6ZfzNPduvMakUfP+zf/GulhzWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ri1NgnNp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ri1NgnNp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B789C4CEF7
	for <loongarch@lists.linux.dev>; Thu,  9 Apr 2026 12:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775738019;
	bh=dZhY8zCfUZtD/49b1gW38xFYGfUfE4+bIqm7BrGAsjw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Ri1NgnNp8/YcYDHcjCc6kbv7HJJp9tQvqjy+PysJqgTkBjuY0izf8nSnWaL0T2mn+
	 NtdbBGtAlFhu+MgCo0WWGMWzEySPatuJqWs3V/QCn4/NL8CmBOKJpdVzQbBBBIlM+j
	 z5vrkYQLAr2hCB1QV+xLdzB75dZ/EglOHuWIwODBeYleH9bUV53ioiAY6D3AwnQgxv
	 g3LeiwsHjtFU6UK/eQ5V5/kN0QpXj46dglVAE80UOGaSXUf9wdxB8LZ6LplutnWeY/
	 9WGg3kc1D79BRU05386OLQSu5mjzCmKb26aOuM7tCEzmKFaNi1971bMm6hvyF/W7Jy
	 d++chM0/wz/3g==
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b97f9587e6eso118497766b.3
        for <loongarch@lists.linux.dev>; Thu, 09 Apr 2026 05:33:39 -0700 (PDT)
X-Gm-Message-State: AOJu0Yxho/jpY/8nTcVh1LL5JOkbSnwLUlb8cEL5xKtXx3l1lcgnR3f5
	uFPZRnClT2tmgpVcIYxHHmoV0YUtzK0YoisVOmoizbhQ0cDeo1axHY/xF/XB40KCdPWE9n3s2uy
	ZSOV8/Np3wBzQ9vsSAAXqu9QSsh6iV5c=
X-Received: by 2002:a17:907:93c7:b0:b9c:1a5:acb4 with SMTP id
 a640c23a62f3a-b9c67b46e89mr945787666b.45.1775738018031; Thu, 09 Apr 2026
 05:33:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260407063350.12479-1-yangtiezhu@loongson.cn>
In-Reply-To: <20260407063350.12479-1-yangtiezhu@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Thu, 9 Apr 2026 20:33:43 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5GkEgec+aO84x+juh149sy2f-=8SA6cTrTwUtpsgP8qA@mail.gmail.com>
X-Gm-Features: AQROBzAOR3DmHQr88ieQHmRNzRDDyKl9m3CobhDQegryXIWQE3Bv9BaRro7e8f8
Message-ID: <CAAhV-H5GkEgec+aO84x+juh149sy2f-=8SA6cTrTwUtpsgP8qA@mail.gmail.com>
Subject: Re: [PATCH v1] LoongArch: Handle CONFIG_32BIT in syscall_get_arch()
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied, thanks.

Huacai

On Tue, Apr 7, 2026 at 2:33=E2=80=AFPM Tiezhu Yang <yangtiezhu@loongson.cn>=
 wrote:
>
> If CONFIG_32BIT is set, it should return AUDIT_ARCH_LOONGARCH32 instead o=
f
> AUDIT_ARCH_LOONGARCH64 in syscall_get_arch().
>
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---
>  arch/loongarch/include/asm/syscall.h | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/arch/loongarch/include/asm/syscall.h b/arch/loongarch/includ=
e/asm/syscall.h
> index 81d2733f7b94..8b5f3a1598af 100644
> --- a/arch/loongarch/include/asm/syscall.h
> +++ b/arch/loongarch/include/asm/syscall.h
> @@ -78,7 +78,11 @@ static inline void syscall_set_arguments(struct task_s=
truct *task,
>
>  static inline int syscall_get_arch(struct task_struct *task)
>  {
> +#ifdef CONFIG_64BIT
>         return AUDIT_ARCH_LOONGARCH64;
> +#else
> +       return AUDIT_ARCH_LOONGARCH32;
> +#endif
>  }
>
>  static inline bool arch_syscall_is_vdso_sigreturn(struct pt_regs *regs)
> --
> 2.42.0
>
>
