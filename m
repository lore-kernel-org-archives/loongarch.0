Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C300317CA3
	for <loongarch@lists.linux.dev>; Tue, 22 Nov 2022 22:51:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0985C433C1;
	Tue, 22 Nov 2022 22:51:14 +0000 (UTC)
Date: Tue, 22 Nov 2022 17:51:12 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Qing Zhang <zhangqing@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 RESEND 2/9] LoongArch/ftrace: Add recordmcount
 support
Message-ID: <20221122175112.513531bd@gandalf.local.home>
In-Reply-To: <20221116082338.5145-3-zhangqing@loongson.cn>
References: <20221116082338.5145-1-zhangqing@loongson.cn>
	<20221116082338.5145-3-zhangqing@loongson.cn>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 16 Nov 2022 16:23:31 +0800
Qing Zhang <zhangqing@loongson.cn> wrote:

> Recordmcount utility under scripts is run, after compiling each object,
> to find out all the locations of calling _mcount() and put them into
> specific seciton named __mcount_loc.
> Then linker collects all such information into a table in the kernel image
> (between __start_mcount_loc and __stop_mcount_loc) for later use by ftrace.
> 
> This patch adds loongarch specific definitions to identify such locations.
> On loongarch, only C version is used to build the kernel now that
> CONFIG_HAVE_C_RECORDMCOUNT is on.
> 
> Signed-off-by: Qing Zhang <zhangqing@loongson.cn>
> ---
>  arch/loongarch/Kconfig |  2 ++
>  scripts/recordmcount.c | 23 +++++++++++++++++++++++
>  2 files changed, 25 insertions(+)
> 

Acked-by: Steven Rostedt (Google) <rostedt@goodmis.org>

-- Steve
