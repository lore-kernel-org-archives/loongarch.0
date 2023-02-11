Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60EE510FD
	for <loongarch@lists.linux.dev>; Sat, 11 Feb 2023 11:13:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3A67C433A1
	for <loongarch@lists.linux.dev>; Sat, 11 Feb 2023 11:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676114029;
	bh=NjE3Eyb+C+hkqgUe0KLLukECmuxsFhs3nDfcZcPPkGY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=W1ZB9Uvy0fiLCE4ZKxiTmP9EBDIqNMofolxUf5Xia4MDDJMMhqBMwhmKRK6qgWGT/
	 G/0md16badfaiZ8L8XRUs0OQ9ax4AUxPsS1xgIIikvhbHcY11wK4LKOUdaPhLxNffh
	 tlaf3lgGXNWMwQWz+RyI851FddBHEgenE6ufOUL6MFQJ60iTDrLhxcMfdmu4RFmhwg
	 g+t0v9of1T8xIKCg7VrFs/x62kEGyYvsitzKc2aHbQ5MmytEoj932WfodthbH7MXhd
	 84XpJxndu8kZZ9xv7GX3bHSrjRKHt+RpN0n86MHQTrJ13Z3fk5Ys094dhYXZDQQO+W
	 W+HaKNnaPuJYA==
Received: by mail-ej1-f52.google.com with SMTP id rp23so21621038ejb.7
        for <loongarch@lists.linux.dev>; Sat, 11 Feb 2023 03:13:48 -0800 (PST)
X-Gm-Message-State: AO0yUKXW9Y60ocxZ9GRbVva6uhr7HSUZekrQ7BB3CsdnNrbM6uA1inuT
	Zuiyz4cupNxOMjUi/MFVovbtrl+050gWFhcl664=
X-Google-Smtp-Source: AK7set85xcodPtw94mhUbxtkXRV4/+VJyaXjUbLoInfjGhosAJ7j0Pj/OOG4oMdQcYunFqRpWxEY/eiQ3pA95B1DQEE=
X-Received: by 2002:a17:906:1182:b0:88d:77e5:defb with SMTP id
 n2-20020a170906118200b0088d77e5defbmr2145900eja.1.1676114027165; Sat, 11 Feb
 2023 03:13:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230211084346.25941-1-zhangqing@loongson.cn>
In-Reply-To: <20230211084346.25941-1-zhangqing@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sat, 11 Feb 2023 19:13:34 +0800
X-Gmail-Original-Message-ID: <CAAhV-H49_49t40UoS+uwDDS1ZSaDaZ9ruXtmx46svxoL9eHuAg@mail.gmail.com>
Message-ID: <CAAhV-H49_49t40UoS+uwDDS1ZSaDaZ9ruXtmx46svxoL9eHuAg@mail.gmail.com>
Subject: Re: [PATCH] selftests/ftrace: add LoongArch support for kprobe args
 string tests
To: Qing Zhang <zhangqing@loongson.cn>
Cc: Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Queued, thanks.

Huacai

On Sat, Feb 11, 2023 at 4:43 PM Qing Zhang <zhangqing@loongson.cn> wrote:
>
> before:
> [5] Kprobe event string type argument   [UNTESTED]
> [7] Kprobe event argument syntax        [UNTESTED]
> after:
> [5] Kprobe event string type argument   [PASS]
> [7] Kprobe event argument syntax        [PASS]
>
> Signed-off-by: Qing Zhang <zhangqing@loongson.cn>
> ---
>  .../selftests/ftrace/test.d/kprobe/kprobe_args_string.tc      | 3 +++
>  .../selftests/ftrace/test.d/kprobe/kprobe_args_syntax.tc      | 4 ++++
>  2 files changed, 7 insertions(+)
>
> diff --git a/tools/testing/selftests/ftrace/test.d/kprobe/kprobe_args_string.tc b/tools/testing/selftests/ftrace/test.d/kprobe/kprobe_args_string.tc
> index 459741565222..a4f8e7c53c1f 100644
> --- a/tools/testing/selftests/ftrace/test.d/kprobe/kprobe_args_string.tc
> +++ b/tools/testing/selftests/ftrace/test.d/kprobe/kprobe_args_string.tc
> @@ -28,6 +28,9 @@ s390*)
>  mips*)
>    ARG1=%r4
>  ;;
> +loongarch*)
> +  ARG1=%r4
> +;;
>  *)
>    echo "Please implement other architecture here"
>    exit_untested
> diff --git a/tools/testing/selftests/ftrace/test.d/kprobe/kprobe_args_syntax.tc b/tools/testing/selftests/ftrace/test.d/kprobe/kprobe_args_syntax.tc
> index d4662c8cf407..1df61e13a812 100644
> --- a/tools/testing/selftests/ftrace/test.d/kprobe/kprobe_args_syntax.tc
> +++ b/tools/testing/selftests/ftrace/test.d/kprobe/kprobe_args_syntax.tc
> @@ -40,6 +40,10 @@ mips*)
>    GOODREG=%r4
>    BADREG=%r12
>  ;;
> +loongarch*)
> +  GOODREG=%r4
> +  BADREG=%r12
> +;;
>  *)
>    echo "Please implement other architecture here"
>    exit_untested
> --
> 2.36.0
>
>
