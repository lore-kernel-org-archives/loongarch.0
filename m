Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90F66290B
	for <loongarch@lists.linux.dev>; Sun, 12 Feb 2023 23:29:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CCCDC433D2;
	Sun, 12 Feb 2023 23:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676244561;
	bh=N5j1gNb+Re0EUJllz+g3X981RTaDhkZJEQX4YsWLntg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=qZvbsejPY7adVJe/ylm0jXSnqaQjBr4gMjdLu7HD0MicyRS5mc87LmWeT1h4PFwai
	 7USe/MSYrrzYUoZRYEX28j9afBhTU1UThttTUFEAn+TcO0+vgDUDXQg+FixduVUzMy
	 zhQzmuKPl0Tx6tNTKkeWen10KCXMEsgSzIQpDxbC4J2ADHwSx1ou49wzJuMm6ZwMvq
	 90Ocx4edd8lNZatpDUJhk9EOQP0SCjULewWLzS3pV5RSb0UQbt1sbP0wQIqMkMB/sN
	 2kNrOf//yu/DW+uTrAN4jaMO+ttHdpRyDOq96yZIkFwbSvOojXhAdduIyFQCNDpLsA
	 5FDJjB1cfqttw==
Date: Mon, 13 Feb 2023 08:29:17 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: Qing Zhang <zhangqing@loongson.cn>
Cc: Steven Rostedt <rostedt@goodmis.org>, Shuah Khan <shuah@kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
Subject: Re: [PATCH] selftests/ftrace: add LoongArch support for kprobe args
 string tests
Message-Id: <20230213082917.68a4fde41f1143fd32c6111b@kernel.org>
In-Reply-To: <20230211084346.25941-1-zhangqing@loongson.cn>
References: <20230211084346.25941-1-zhangqing@loongson.cn>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 11 Feb 2023 16:43:46 +0800
Qing Zhang <zhangqing@loongson.cn> wrote:

> before:
> [5] Kprobe event string type argument	[UNTESTED]
> [7] Kprobe event argument syntax	[UNTESTED]
> after:
> [5] Kprobe event string type argument	[PASS]
> [7] Kprobe event argument syntax	[PASS]
> 

Thanks for updating the test!

Reviewed-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>

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


-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>
