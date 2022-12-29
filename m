Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1841A8C14
	for <loongarch@lists.linux.dev>; Thu, 29 Dec 2022 23:12:00 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id i15so28529894edf.2
        for <loongarch@lists.linux.dev>; Thu, 29 Dec 2022 15:11:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fr5Dp6z4f+jilNzGhOxLLdNUpFY97wXoG/UnXaa4JzU=;
        b=S6wwXFolr/ilVUjRpBaJWRjhiDU+FZiMD6RDgZqX5qWFjIR3kzcMshAaPepDvivql1
         UeFWCJ+0pHg4CS9rmbJ+Tp9pyeRr/dhn9GWxTqQWCh/UCqjjMkswROYPXZ47t25PtG0X
         ir5MTNurB5Ue3ZFMVw163nvOQ37qtR6ysnpp45Y94lKH/Ib5rhSItAyw6/ERFnuIfpg0
         dp0479Nik1GUjrp3aCA2v5h3oIz0zXqeaEK+pgOKCHUaxCdnoldmyItsIIE7r5soz7JQ
         yk03fXD1wafsJWgJBKNMAm/mRbKg7yImq/eBLJ1w9VAuVWl8cKZSxsqxJ44EzPairvJw
         HVMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fr5Dp6z4f+jilNzGhOxLLdNUpFY97wXoG/UnXaa4JzU=;
        b=y9sdOpBZ3yLtNDhYEjzAAqixEQ5V5ql75hE+FTaQGqFsKvR5KcMzT/WKQdh+lwDxoB
         ZAaED3ugedDrc9B0CcRMAl0qlf5lASqKf5oVKJc6yUVlHcj/tEID7dx6JS81zAtanvoE
         EQkp+C+am8chddZK6XBS1clFjGkAlaiHNGf2u2cejmMKOYT3n0MHMpKgwYVR71XpdWYo
         I0CYGs2YmPNPKYCun/MYYvLnQbKXJUIsgff49pqF+5kXQ7yF4Lx0PkgQAlsnixyZIXtn
         RMKrkbR521ftgqH+dfY2PnXFi6fpH9sBsnUl4u++ImGHbKbRBW03B/Ggfv7BFI+scNqp
         dV3g==
X-Gm-Message-State: AFqh2kq/S+iaFLYBZNQdlp320vKqlthh+pNm1VIGiQxwZrk6HHE8WIVW
	6ZUuUj6+1boLIIQV/tjaHMzFKzbwZ9OylcbLn8Y=
X-Google-Smtp-Source: AMrXdXsgC47xYvfabST0IS+bdmGgXf5W0aQFJNuccqvnuocz8xmo7N2LYY2P3zDLoNkOiG1zNlRKCAhNJKkTMRtg5Eg=
X-Received: by 2002:aa7:cb52:0:b0:484:93ac:33a6 with SMTP id
 w18-20020aa7cb52000000b0048493ac33a6mr1289797edt.81.1672355518400; Thu, 29
 Dec 2022 15:11:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221225120138.1236072-1-hengqi.chen@gmail.com>
In-Reply-To: <20221225120138.1236072-1-hengqi.chen@gmail.com>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Thu, 29 Dec 2022 15:11:46 -0800
Message-ID: <CAEf4BzYzjJWy=hYp0vQBTW1Q0UODLeeq+bHSdjvkhNXGGpp4wQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next] libbpf: Add LoongArch support to bpf_tracing.h
To: Hengqi Chen <hengqi.chen@gmail.com>
Cc: bpf@vger.kernel.org, loongarch@lists.linux.dev, andrii@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, Dec 25, 2022 at 4:02 AM Hengqi Chen <hengqi.chen@gmail.com> wrote:
>
> Add PT_REGS macros for LoongArch64 ([0]).
>
>   [0]: https://loongson.github.io/LoongArch-Documentation/LoongArch-ELF-ABI-EN.html
>
> Signed-off-by: Hengqi Chen <hengqi.chen@gmail.com>
> ---
>  tools/lib/bpf/bpf_tracing.h | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>
> diff --git a/tools/lib/bpf/bpf_tracing.h b/tools/lib/bpf/bpf_tracing.h
> index 2972dc25ff72..5a8a0830d133 100644
> --- a/tools/lib/bpf/bpf_tracing.h
> +++ b/tools/lib/bpf/bpf_tracing.h
> @@ -32,6 +32,9 @@
>  #elif defined(__TARGET_ARCH_arc)
>         #define bpf_target_arc
>         #define bpf_target_defined
> +#elif defined(__TARGET_ARCH_loongarch)
> +       #define bpf_target_loongarch
> +       #define bpf_target_defined
>  #else
>
>  /* Fall back to what the compiler says */
> @@ -62,6 +65,9 @@
>  #elif defined(__arc__)
>         #define bpf_target_arc
>         #define bpf_target_defined
> +#elif defined(__loongarch__) && __loongarch_grlen == 64
> +       #define bpf_target_loongarch
> +       #define bpf_target_defined
>  #endif /* no compiler target */
>
>  #endif
> @@ -258,6 +264,21 @@ struct pt_regs___arm64 {
>  /* arc does not select ARCH_HAS_SYSCALL_WRAPPER. */
>  #define PT_REGS_SYSCALL_REGS(ctx) ctx
>
> +#elif defined(bpf_target_loongarch)
> +

please put https://loongson.github.io/LoongArch-Documentation/LoongArch-ELF-ABI-EN.html
in a comment somewhere here


> +#define __PT_PARM1_REG regs[4]
> +#define __PT_PARM2_REG regs[5]
> +#define __PT_PARM3_REG regs[6]
> +#define __PT_PARM4_REG regs[7]
> +#define __PT_PARM5_REG regs[8]
> +#define __PT_RET_REG regs[1]
> +#define __PT_FP_REG regs[22]
> +#define __PT_RC_REG regs[4]
> +#define __PT_SP_REG regs[3]
> +#define __PT_IP_REG csr_era
> +/* loongarch does not select ARCH_HAS_SYSCALL_WRAPPER. */
> +#define PT_REGS_SYSCALL_REGS(ctx) ctx
> +
>  #endif
>
>  #if defined(bpf_target_defined)
> --
> 2.31.1
