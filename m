Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AAF36121
	for <loongarch@lists.linux.dev>; Sat, 20 Aug 2022 01:52:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D07E2C433C1;
	Sat, 20 Aug 2022 01:52:27 +0000 (UTC)
Date: Fri, 19 Aug 2022 21:52:40 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Jinyang He <hejinyang@loongson.cn>
Cc: Qing Zhang <zhangqing@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, WANG Xuerui <kernel@xen0n.name>,
 loongarch@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: Re: [PATCH 1/9] LoongArch/ftrace: Add basic support
Message-ID: <20220819215240.3caf89e2@gandalf.local.home>
In-Reply-To: <246779c0-b834-16a6-ec68-c06d8f9a375d@loongson.cn>
References: <20220819081403.7143-1-zhangqing@loongson.cn>
	<20220819081403.7143-2-zhangqing@loongson.cn>
	<20220819132509.127a1353@gandalf.local.home>
	<246779c0-b834-16a6-ec68-c06d8f9a375d@loongson.cn>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 20 Aug 2022 09:38:21 +0800
Jinyang He <hejinyang@loongson.cn> wrote:

> I think we have implemented CONFIG_FTRACE_WITH_ARGS in dynamic ftrace
> in the [Patch3/9]. 

Sorry, I must have missed it.

> But, for non dynamic ftrace, it is hardly to
> implement it. Because the LoongArch compiler gcc treats mount as a

Don't bother implementing it for non-dynamic. I would just add a:

config HAVE_FTRACE_WITH_ARGS if DYNAMIC_FTRACE

and be done with it.

> really call, like 'call _mcount(__builtin_return_address(0))'. That
> means, they decrease stack, save args to callee saved regs and may
> do some optimization before calling mcount. It is difficult to find the
> original args and apply changes from tracers.

Right, there's no point in implementing it for non dynamic. Like I said,
non-dynamic is just a stepping stone for getting dynamic working. Once you
have dynamic working, it's up to you to throw out the non-dynamic. It's not
useful for anything other than porting to a new architecture or for
academic purposes.

-- Steve
