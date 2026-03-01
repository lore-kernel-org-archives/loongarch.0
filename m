Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEF1F63CB
	for <loongarch@lists.linux.dev>; Sun,  1 Mar 2026 06:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772346677; cv=none; b=UxVDD5ZbemAYQKsyEw5VTEvAekezJGcCtlvUSsbLYthuTBGX7CKOqkBLOY7mBaMznttm9E/33WgUtVK1biVoaatJaoDVAr5/8u1Tpo0gPHGFgPYgaeyhkrbHy+EqnWaueQjrVwbFgBjMpt3hxdnC3VbsPbNTBCoZZexCSSjJ6KI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772346677; c=relaxed/simple;
	bh=PdqmIItn7OjJRkJ5j5P7b5Mdc37I02Ft+oe+RbqG8+E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dEdBop/hiTPOMEFaMHTgotT9l4pRH+Md+uwctrCQBcuy65ePfBAAlnF+BZRSe2mEF8hfW3U9Xub3JZgDrKy8hU8plTy3urOQwNZ11s0x030N1SBMujnWkUPLc4TKCvsO+5zJ6mrwQ1Zri8uQLam7DFPvklxe58OQLWILI3CfIAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cbunPj0n; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cbunPj0n"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79C49C116C6
	for <loongarch@lists.linux.dev>; Sun,  1 Mar 2026 06:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772346677;
	bh=PdqmIItn7OjJRkJ5j5P7b5Mdc37I02Ft+oe+RbqG8+E=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=cbunPj0n1yijfP4XTXz5jtY/yyBObbPi7iHgKvOClnFXG437iip/OlmS/2/jsvg/+
	 vRu3h/WHSHfz7i0PWW1kfjjYYwR96spvfo21fmXtjzbt2aPc7hluQgDwKARgg6r2qR
	 PAWi3FVNKKoWHzcr+qLuQw7QuHlEzCqKAlSP9QjvphpzJ8LryHY/oSBXSdHRcAajyb
	 zupYyZwkaG/qvcH5WKjFwTr8SA7n9Tcmy6JmZYNxEZDxiwQ1S1bWQixv13efuoXZ8z
	 l42ybIujMpgdThO8kq6dfKumIKT6teR8/HBXBkwGtEPXUyZ4ZwmunK5AZAnv2t6Adb
	 9T8WfDHPg0Ckw==
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-65c5a7785b4so5038164a12.1
        for <loongarch@lists.linux.dev>; Sat, 28 Feb 2026 22:31:17 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUqSpUgDgYEKW+Gx9DZDsE2uoMhypHqMP0U4PIjgouLxJpb0AoI8WJIONKvs9oouA/Oq21lsaxfE2k=@lists.linux.dev
X-Gm-Message-State: AOJu0YxP69KtmCsbFjLyWJS0ZGCYbB8ax6jbaryxkGDttWcyVC4QZ9vr
	gTeFgGIceb9JF1jE5Nf1yZ5bA+ioVNef72a4Kr7wQkU9bxASHM6wnZi9JPbzjJl2pyA6VDIlst9
	3pRTitD2Ufi7744WvIB0YqosuwElb3rM=
X-Received: by 2002:a05:6402:4311:b0:65c:20dc:9048 with SMTP id
 4fb4d7f45d1cf-65fdd6bda94mr5301723a12.4.1772346676002; Sat, 28 Feb 2026
 22:31:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260301012742.1685273-1-sashal@kernel.org>
In-Reply-To: <20260301012742.1685273-1-sashal@kernel.org>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sun, 1 Mar 2026 14:31:04 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5VAkxas275gJGJ4QZnowHLaudCea-0b6vVWue+RsrsRw@mail.gmail.com>
X-Gm-Features: AaiRm511xbNzsL4e3JTZLPyHggpwCk9m0t5nQotR9TkBrHdgW952N0qV2qHFiPo
Message-ID: <CAAhV-H5VAkxas275gJGJ4QZnowHLaudCea-0b6vVWue+RsrsRw@mail.gmail.com>
Subject: Re: FAILED: Patch "LoongArch: Guard percpu handler under
 !CONFIG_PREEMPT_RT" failed to apply to 6.12-stable tree
To: Sasha Levin <sashal@kernel.org>
Cc: stable@vger.kernel.org, yangtiezhu@loongson.cn, 
	Huacai Chen <chenhuacai@loongson.cn>, loongarch@lists.linux.dev, 
	linux-rt-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Sasha,

On Sun, Mar 1, 2026 at 9:27=E2=80=AFAM Sasha Levin <sashal@kernel.org> wrot=
e:
>
> The patch below does not apply to the 6.12-stable tree.
> If someone wants it applied there, or to any other stable or longterm
> tree, then please email the backport, including the original git commit
> id to <stable@vger.kernel.org>.
I'm very confused because it can be applied and already here:
https://git.kernel.org/pub/scm/linux/kernel/git/stable/stable-queue.git/tre=
e/queue-6.12

Huacai

>
> Thanks,
> Sasha
>
> ------------------ original commit in Linus's tree ------------------
>
> From 70b0faae3590c628a98a627a10e5d211310169d4 Mon Sep 17 00:00:00 2001
> From: Tiezhu Yang <yangtiezhu@loongson.cn>
> Date: Tue, 10 Feb 2026 19:31:13 +0800
> Subject: [PATCH] LoongArch: Guard percpu handler under !CONFIG_PREEMPT_RT
>
> After commit 88fd2b70120d ("LoongArch: Fix sleeping in atomic context for
> PREEMPT_RT"), it should guard percpu handler under !CONFIG_PREEMPT_RT to
> avoid redundant operations.
>
> Cc: stable@vger.kernel.org
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> ---
>  arch/loongarch/kernel/unwind_prologue.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/loongarch/kernel/unwind_prologue.c b/arch/loongarch/ker=
nel/unwind_prologue.c
> index 729e775bd40dd..ee1c29686ab05 100644
> --- a/arch/loongarch/kernel/unwind_prologue.c
> +++ b/arch/loongarch/kernel/unwind_prologue.c
> @@ -65,7 +65,7 @@ static inline bool scan_handlers(unsigned long entry_of=
fset)
>
>  static inline bool fix_exception(unsigned long pc)
>  {
> -#ifdef CONFIG_NUMA
> +#if defined(CONFIG_NUMA) && !defined(CONFIG_PREEMPT_RT)
>         int cpu;
>
>         for_each_possible_cpu(cpu) {
> --
> 2.51.0
>
>
>
>
>
