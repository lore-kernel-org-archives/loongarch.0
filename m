Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ABFC36D
	for <loongarch@lists.linux.dev>; Mon, 27 Nov 2023 02:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WNCNFiaH"
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-3b83398cfc7so2385065b6e.3
        for <loongarch@lists.linux.dev>; Sun, 26 Nov 2023 18:41:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701052906; x=1701657706; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UJClfc4sDLiEj/eSTt+VCec2Lgvh20eFtg0zCQJNbx4=;
        b=WNCNFiaHjypFzyVD+jxPqGAPYV/QfEXQMVQxqbJ4vgBByWUP5+2wRcjAri7us7RHyq
         tYWybMpRjZ7/MC2mXYZWouccUWJrcVh7I+RdlWYBH8HoSKAN43ZnY9K7P8mMkAot0U+m
         OJ3kRlPsrsn4fLFJPcqt7XfAIph4QCnIwzO21UVfwPY3Ie5iPJg0Jh9fT3FiC+j2XmvL
         cnvCBtxkMgjwhsmorJzxQwpm3/sskjlTMtQLUEH9E7DM6nF/WdetbYvegPaJrO0wD2nu
         5T89a5BB1KhCUE9mIAd/F0/m+HPjovgTfzZb9gYb8XIk5SI5SnYgJtvjNMoOYSUaL31l
         h6qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701052906; x=1701657706;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UJClfc4sDLiEj/eSTt+VCec2Lgvh20eFtg0zCQJNbx4=;
        b=WRrm1IyWLbklKkfgoJqzbNg7PdB6IV4JRj6g6+ZXsNDVBbj7ltolLDM7b97ZimKP9w
         VQUuAUMl0U2RDtpdoBU0oSEpstKeqfmbPBIgN+hrf6CyYQRsrLGaNgZIuayLfLXjAdLc
         KIHdFhnuPvkTNMOYAxExA0QRtCGXZuHfTq2rxlkmBJMowb0Nbs/ZqdsOWY5JrfA9O2ye
         lPR44co1NopMaQKVwMIJlvPb/9ytxa7swXNk6NyfnpfMKItcQsrZY66ImcZ87vXNK2QF
         ix62+zo3OwICkCk+wnyNbE+u951g61H/Ssv1M99ja3xAU66incowdMK9k1ablVkY5Q1E
         cvxw==
X-Gm-Message-State: AOJu0YwEqRikbri8pvTNcI6wUsw7XWyia/6hYitzwPLDfKkaiCXVsS9z
	3w9df1koIy2dWe1S6ElqGYf5e1EeFeOGWrO8/KU=
X-Google-Smtp-Source: AGHT+IGHwCnnl/V4HEAdOxYhHMW6DPwEZ/BDf+qy3Yzj4LFXLVT3ZHq32Wm/RxTQIoL07zqbsDCNidoIBsf7jHQC8Po=
X-Received: by 2002:a05:6870:558f:b0:1fa:3678:6c4e with SMTP id
 qj15-20020a056870558f00b001fa36786c4emr4960309oac.8.1701052906041; Sun, 26
 Nov 2023 18:41:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231126121002.22568-1-hejinyang@loongson.cn>
In-Reply-To: <20231126121002.22568-1-hejinyang@loongson.cn>
From: Hengqi Chen <hengqi.chen@gmail.com>
Date: Mon, 27 Nov 2023 10:41:35 +0800
Message-ID: <CAEyhmHRCJootEEcYo_S7BdCq5LhN5MBG3ut5oYrSLd8R8jWG8A@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: Set unwind stack type to unknown rather than
 set error flag
To: Jinyang He <hejinyang@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 26, 2023 at 8:10=E2=80=AFPM Jinyang He <hejinyang@loongson.cn> =
wrote:
>
> During the unwinding, unwind_done() is used as an end condition. Normally
> it unwind to the user stack and then set the stack type to unknown, which
> is a normal exit. When something unexpected happens in unwind process and
> we cannot unwind anymore, we should set the error flag, and also set the
> stack type to unknown to indicate that the unwind process cannot continue=
.
> The error flag emphasizes that the unwind process produce an unexpected
> error. There is no unexpected things when we unwind the PT_REGS in the
> top of IRQ stack and find out that is an user mode PT_REGS. Thus, we
> should not set error flag and just set stack type to unknown.
>
> Reported-by: Hengqi Chen <hengqi.chen@gmail.com>
> Signed-off-by: Jinyang He <hejinyang@loongson.cn>
> ---
>  arch/loongarch/kernel/stacktrace.c      | 2 +-
>  arch/loongarch/kernel/unwind.c          | 1 -
>  arch/loongarch/kernel/unwind_prologue.c | 2 +-
>  3 files changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/arch/loongarch/kernel/stacktrace.c b/arch/loongarch/kernel/s=
tacktrace.c
> index 92270f14db94..f623feb2129f 100644
> --- a/arch/loongarch/kernel/stacktrace.c
> +++ b/arch/loongarch/kernel/stacktrace.c
> @@ -32,7 +32,7 @@ void arch_stack_walk(stack_trace_consume_fn consume_ent=
ry, void *cookie,
>         }
>
>         for (unwind_start(&state, task, regs);
> -            !unwind_done(&state) && !unwind_error(&state); unwind_next_f=
rame(&state)) {
> +            !unwind_done(&state); unwind_next_frame(&state)) {
>                 addr =3D unwind_get_return_address(&state);
>                 if (!addr || !consume_entry(cookie, addr))
>                         break;
> diff --git a/arch/loongarch/kernel/unwind.c b/arch/loongarch/kernel/unwin=
d.c
> index ba324ba76fa1..a463d6961344 100644
> --- a/arch/loongarch/kernel/unwind.c
> +++ b/arch/loongarch/kernel/unwind.c
> @@ -28,6 +28,5 @@ bool default_next_frame(struct unwind_state *state)
>
>         } while (!get_stack_info(state->sp, state->task, info));
>
> -       state->error =3D true;
>         return false;
>  }
> diff --git a/arch/loongarch/kernel/unwind_prologue.c b/arch/loongarch/ker=
nel/unwind_prologue.c
> index 55afc27320e1..929ae240280a 100644
> --- a/arch/loongarch/kernel/unwind_prologue.c
> +++ b/arch/loongarch/kernel/unwind_prologue.c
> @@ -227,7 +227,7 @@ static bool next_frame(struct unwind_state *state)
>         } while (!get_stack_info(state->sp, state->task, info));
>
>  out:
> -       state->error =3D true;
> +       state->stack_info.type =3D STACK_TYPE_UNKNOWN;
>         return false;
>  }
>
> --
> 2.42.0
>

Acked-by: Hengqi Chen <hengqi.chen@gmail.com>
