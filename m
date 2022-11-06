Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E44D1851
	for <loongarch@lists.linux.dev>; Sun,  6 Nov 2022 14:34:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B69EC43470
	for <loongarch@lists.linux.dev>; Sun,  6 Nov 2022 14:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667745243;
	bh=t7PnW6M+OwiGjkiaSxqoLbKXfEPsRqNR8JAa9rvyIbw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ACNacU4tZErMBneJ7NrGFwoPcWQDGus2zqpaQwVgyXJB/MKhk95NpBy0Uh8wGRjEe
	 i0fPzMfziXbk9qPm+roE4LCOblm5aPXx/p0Fh1hdA9JesA568ArX+QfeWa+0ePPnB/
	 fkHoPk82bTYhjNE4MzCqQHip1kY9cbniNDu0capsBs4fgaWOYJyhK/qAFwWiiJI25M
	 SJpI26QWngc+p/UfEBUp6OVC6WIbM2MaWjORPXZYP8q1WmQqAq2ecSS/o//w1MG+EY
	 2RxksOY2YA+AVLUqSbi4ue9Qm3Mrgeb4LSt87ODXbjTDUclPaci//HqTt9fitbtADq
	 l6OCoIrB4bv4g==
Received: by mail-ed1-f53.google.com with SMTP id f7so13943978edc.6
        for <loongarch@lists.linux.dev>; Sun, 06 Nov 2022 06:34:02 -0800 (PST)
X-Gm-Message-State: ACrzQf1tHh7IK4teNiNneFAAhvsjd3KifRnqk5pNMww1GUJjgHMwzpYp
	gmcW2SYA91GlYW3OmFIXM5A7bz3JnhPP91VRPrI=
X-Google-Smtp-Source: AMsMyM4VbRUuXP3UuyRpw12buCInZJQ7sUuNZcUiLjLMTCeTaMbuqy3gn9JdtphAxWwukNnbXX8yVcZaO3lXnTB6WeA=
X-Received: by 2002:aa7:c913:0:b0:462:e375:a1fe with SMTP id
 b19-20020aa7c913000000b00462e375a1femr45282457edt.156.1667745241225; Sun, 06
 Nov 2022 06:34:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <63425a0e.b8.1844c7a5d80.Coremail.wangkailong@jari.cn>
In-Reply-To: <63425a0e.b8.1844c7a5d80.Coremail.wangkailong@jari.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sun, 6 Nov 2022 22:33:48 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5oPv0RnEE6p8K5rCsEEJyfE0QyG4sjBDtVkEQbSSyFEg@mail.gmail.com>
Message-ID: <CAAhV-H5oPv0RnEE6p8K5rCsEEJyfE0QyG4sjBDtVkEQbSSyFEg@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: Fix unsigned comparison with less than zero
To: wangkailong@jari.cn
Cc: kernel@xen0n.name, zhangqing@loongson.cn, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Queued for loongarch-fixes, thanks.

Huacai

On Sun, Nov 6, 2022 at 6:32 PM <wangkailong@jari.cn> wrote:
>
> Eliminate the following coccicheck warning:
>
> ./arch/loongarch/kernel/unwind_prologue.c:84:5-13: WARNING: Unsigned
> expression compared with zero: frame_ra < 0
>
> Signed-off-by: KaiLong Wang <wangkailong@jari.cn>
> ---
>  arch/loongarch/kernel/unwind_prologue.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/arch/loongarch/kernel/unwind_prologue.c b/arch/loongarch/kernel/unwind_prologue.c
> index b206d9159205..58ccdbe7fa22 100644
> --- a/arch/loongarch/kernel/unwind_prologue.c
> +++ b/arch/loongarch/kernel/unwind_prologue.c
> @@ -43,7 +43,8 @@ static bool unwind_by_prologue(struct unwind_state *state)
>  {
>         struct stack_info *info = &state->stack_info;
>         union loongarch_instruction *ip, *ip_end;
> -       unsigned long frame_size = 0, frame_ra = -1;
> +       unsigned long frame_size = 0;
> +       long frame_ra = -1;
>         unsigned long size, offset, pc = state->pc;
>
>         if (state->sp >= info->end || state->sp < info->begin)
> --
> 2.25.1
