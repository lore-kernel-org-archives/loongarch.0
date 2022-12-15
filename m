Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7D8820FE
	for <loongarch@lists.linux.dev>; Thu, 15 Dec 2022 06:16:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD792C43392
	for <loongarch@lists.linux.dev>; Thu, 15 Dec 2022 06:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1671084968;
	bh=i5u6MwDdjMbl5c62Ma9C2VxUrEeox5PSRWqUh/AyUOM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=bYBxL/j3L6TZTDNkVK26+NjmtaT8e4t9QlRqZIyKMnZRdFpRD4gkOaJNqGj0nEVKL
	 OxlSvV8UNZSD6F4hIvwPU0iaMpfOHByI+/fsGLyn06LfpH4j/M7V5FFakVxHhgdqmq
	 Om7DgZgNrftZTF63PgUUllOliS6y4X2ppyFPRgiQSv8qhRTf1SGk3Yj+5SolSmrMJX
	 1AnmTbmUH0HcsZA5byz1DJbPBqnlJCHvu8InXZjyoJbyG7opD32/G5ccYr59Nxwq7f
	 dTXB1QPauz6DGBLfmzIdCdDer8hnctDwYF0l8wyOYLmmop3HCFYF4JyD4+2VLAKZt8
	 eltaXfdlJGrtQ==
Received: by mail-ed1-f45.google.com with SMTP id e13so25664341edj.7
        for <loongarch@lists.linux.dev>; Wed, 14 Dec 2022 22:16:08 -0800 (PST)
X-Gm-Message-State: ANoB5pkgr3aSZ6fydIjc52dOMD9MFGcaH5XkHW+ecMN9Mlh9VWjyNL1S
	n87BRpiSgPOHdzwZBEcY/nVEFi54hdK83BH4dtk=
X-Google-Smtp-Source: AA0mqf6xmKh3r7oa6Lk2eyWTOlV7MSnF+EjabO7TglwWDZKTW0VKcmfj/+TaGNvJknxbhkD612pN97/NiknIXBa8Boc=
X-Received: by 2002:a05:6402:5388:b0:46a:f4b0:2d23 with SMTP id
 ew8-20020a056402538800b0046af4b02d23mr46876515edb.78.1671084966816; Wed, 14
 Dec 2022 22:16:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221215040141.18610-1-hejinyang@loongson.cn> <20221215040141.18610-6-hejinyang@loongson.cn>
In-Reply-To: <20221215040141.18610-6-hejinyang@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Thu, 15 Dec 2022 14:15:57 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4QwWV+q_ROSbw10n3mj64BPsiAoErR7k_wZ4v0zG3nhw@mail.gmail.com>
Message-ID: <CAAhV-H4QwWV+q_ROSbw10n3mj64BPsiAoErR7k_wZ4v0zG3nhw@mail.gmail.com>
Subject: Re: [PATCH 5/6] LoongArch: Add raw_show_trace to enable guess
 unwinder default
To: Jinyang He <hejinyang@loongson.cn>
Cc: WANG Xuerui <kernel@xen0n.name>, Qing Zhang <zhangqing@loongson.cn>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Content-Type: text/plain; charset="UTF-8"

Hi, Jinyang,

Is this patch really necessary?

Huacai

On Thu, Dec 15, 2022 at 12:02 PM Jinyang He <hejinyang@loongson.cn> wrote:
>
> Inspired by MIPS, add cmdline parameter named 'raw_show_trace' to
> enable guess unwinder in prologue unwinder unwind_start() default.
> In some cases the guess is more efficient than prologue.
>
> Signed-off-by: Jinyang He <hejinyang@loongson.cn>
> ---
>  arch/loongarch/kernel/unwind_prologue.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/arch/loongarch/kernel/unwind_prologue.c b/arch/loongarch/kernel/unwind_prologue.c
> index 9677e13c4b4c..441641227c10 100644
> --- a/arch/loongarch/kernel/unwind_prologue.c
> +++ b/arch/loongarch/kernel/unwind_prologue.c
> @@ -122,11 +122,22 @@ static bool unwind_by_prologue(struct unwind_state *state)
>         return !!__kernel_text_address(state->pc);
>  }
>
> +static int raw_show_trace;
> +static int __init set_raw_show_trace(char *str)
> +{
> +       raw_show_trace = 1;
> +       return 1;
> +}
> +__setup("raw_show_trace", set_raw_show_trace);
> +
>  static void start(struct unwind_state *state, struct task_struct *task,
>                     struct pt_regs *regs)
>  {
>         state->first = true;
>
> +       if (raw_show_trace)
> +               unwind_register_unwinder(state, guard_unwinder);
> +
>         /*
>          * The current PC is not kernel text address, we cannot find its
>          * relative symbol. Thus, prologue analysis will be broken. Luckly,
> --
> 2.34.3
>
