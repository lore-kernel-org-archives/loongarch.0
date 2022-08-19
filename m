Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C9A8182
	for <loongarch@lists.linux.dev>; Fri, 19 Aug 2022 16:53:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FE66C433C1;
	Fri, 19 Aug 2022 16:53:31 +0000 (UTC)
Date: Fri, 19 Aug 2022 12:53:43 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Jinyang He <hejinyang@loongson.cn>
Cc: Qing Zhang <zhangqing@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, WANG Xuerui <kernel@xen0n.name>,
 loongarch@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: Re: [PATCH 1/9] LoongArch/ftrace: Add basic support
Message-ID: <20220819125343.1623d850@gandalf.local.home>
In-Reply-To: <f9b12eed-a7a0-0f2b-4679-1f465e22cad6@loongson.cn>
References: <20220819081403.7143-1-zhangqing@loongson.cn>
	<20220819081403.7143-2-zhangqing@loongson.cn>
	<f9b12eed-a7a0-0f2b-4679-1f465e22cad6@loongson.cn>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 19 Aug 2022 17:29:29 +0800
Jinyang He <hejinyang@loongson.cn> wrote:

> It seems this patch adds non-dynamic ftrace, this code should not
> appear here.
> BTW is it really necessary for non-dynamic ftrace? I do not use it
> directly and frequently, IMHO, non-dynamic can be completely
> 
> replaced dynamic?

Note, I keep the non dynamic ftrace around for debugging purposes.

But sure, it's pretty useless. It's also good for bringing ftrace to a new
architecture (like this patch is doing), as it is easier to implement than
dynamic ftrace, and getting the non-dynamic working is usually the first
step in getting dynamic ftrace working.

But it's really up to the arch maintainers to keep it or not.

-- Steve
