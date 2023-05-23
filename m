Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C33A74C7B
	for <loongarch@lists.linux.dev>; Tue, 23 May 2023 14:34:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D43B9C433EF;
	Tue, 23 May 2023 14:34:39 +0000 (UTC)
Date: Tue, 23 May 2023 10:34:38 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Youling Tang <tangyouling@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Mark Rutland <mark.rutland@arm.com>, WANG Xuerui
 <kernel@xen0n.name>, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, loongarch@lists.linux.dev,
 loongson-kernel@lists.loongnix.cn, Qing Zhang <zhangqing@loongson.cn>
Subject: Re: [PATCH v2 4/5] LoongArch: ftrace: Add direct call trampoline
 samples support
Message-ID: <20230523103438.7be15275@rorschach.local.home>
In-Reply-To: <1682561552-32324-5-git-send-email-tangyouling@loongson.cn>
References: <1682561552-32324-1-git-send-email-tangyouling@loongson.cn>
	<1682561552-32324-5-git-send-email-tangyouling@loongson.cn>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 27 Apr 2023 10:12:31 +0800
Youling Tang <tangyouling@loongson.cn> wrote:

> The ftrace samples need per-architecture trampoline implementations
> to save and restore argument registers around the calls to
> my_direct_func* and to restore polluted registers (eg: ra).
> 
> Signed-off-by: Qing Zhang <zhangqing@loongson.cn>
> Signed-off-by: Youling Tang <tangyouling@loongson.cn>
> ---
>  arch/loongarch/Kconfig                      |  2 +
>  samples/ftrace/ftrace-direct-modify.c       | 34 +++++++++++++++++
>  samples/ftrace/ftrace-direct-multi-modify.c | 41 +++++++++++++++++++++
>  samples/ftrace/ftrace-direct-multi.c        | 25 +++++++++++++
>  samples/ftrace/ftrace-direct-too.c          | 27 ++++++++++++++
>  samples/ftrace/ftrace-direct.c              | 23 ++++++++++++
>  6 files changed, 152 insertions(+)

Acked-by: Steven Rostedt (Google) <rostedt@goodmis.org>

-- Steve
