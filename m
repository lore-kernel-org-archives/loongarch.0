Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E65C263AD
	for <loongarch@lists.linux.dev>; Mon, 24 Apr 2023 20:23:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37CD0C433D2;
	Mon, 24 Apr 2023 20:23:02 +0000 (UTC)
Date: Mon, 24 Apr 2023 16:23:00 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Donglin Peng <pengdonglin@sangfor.com.cn>
Cc: mhiramat@kernel.org, huangcun@sangfor.com.cn, dinghui@sangfor.com.cn,
 catalin.marinas@arm.com, mark.rutland@arm.com, paul.walmsley@sifive.com,
 palmer@dabbelt.com, bp@alien8.de, tglx@linutronix.de,
 aou@eecs.berkeley.edu, rmk+kernel@armlinux.org.uk, linux@armlinux.org.uk,
 will@kernel.org, peterz@infradead.org, mingo@redhat.com,
 zhangqing@loongson.cn, chenhuacai@kernel.org, kernel@xen0n.name,
 dolinux.peng@gmail.com, x86@kernel.org, linux-trace-kernel@vger.kernel.org,
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Florian
 Kauer <florian.kauer@linutronix.de>, dave.hansen@linux.intel.com,
 hpa@zytor.com, xiehuan09@gmail.com
Subject: Re: [PATCH v11 1/8] function_graph: Support recording and printing
 the return value of function
Message-ID: <20230424162300.67daca4f@rorschach.local.home>
In-Reply-To: <7eabae11-6a65-c51d-ff39-8205057e497a@sangfor.com.cn>
References: <cover.1680954589.git.pengdonglin@sangfor.com.cn>
	<1fc502712c981e0e6742185ba242992170ac9da8.1680954589.git.pengdonglin@sangfor.com.cn>
	<66fe9288-05ff-1bf3-dd40-e7b3cbdf1af9@sangfor.com.cn>
	<7eabae11-6a65-c51d-ff39-8205057e497a@sangfor.com.cn>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 14 Apr 2023 15:55:05 +0800
Donglin Peng <pengdonglin@sangfor.com.cn> wrote:

> Hi Steve, could you please correct this mistake before merging it into
> linux-next?

Will do.

-- Steve
