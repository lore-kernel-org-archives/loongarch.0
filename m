Received: from mail-m127105.qiye.163.com (mail-m127105.qiye.163.com [115.236.127.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A2F07F1
	for <loongarch@lists.linux.dev>; Fri, 14 Apr 2023 07:55:13 +0000 (UTC)
Received: from [172.23.196.219] (unknown [121.32.254.149])
	by mail-m127105.qiye.163.com (Hmail) with ESMTPA id 5D0BD580169;
	Fri, 14 Apr 2023 15:55:08 +0800 (CST)
Message-ID: <7eabae11-6a65-c51d-ff39-8205057e497a@sangfor.com.cn>
Date: Fri, 14 Apr 2023 15:55:05 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v11 1/8] function_graph: Support recording and printing
 the return value of function
Content-Language: en-US
From: Donglin Peng <pengdonglin@sangfor.com.cn>
To: mhiramat@kernel.org, rostedt@goodmis.org
Cc: huangcun@sangfor.com.cn, dinghui@sangfor.com.cn, catalin.marinas@arm.com,
 mark.rutland@arm.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
 bp@alien8.de, tglx@linutronix.de, aou@eecs.berkeley.edu,
 rmk+kernel@armlinux.org.uk, linux@armlinux.org.uk, will@kernel.org,
 peterz@infradead.org, mingo@redhat.com, zhangqing@loongson.cn,
 chenhuacai@kernel.org, kernel@xen0n.name, dolinux.peng@gmail.com,
 x86@kernel.org, linux-trace-kernel@vger.kernel.org,
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Florian Kauer <florian.kauer@linutronix.de>, dave.hansen@linux.intel.com,
 hpa@zytor.com, xiehuan09@gmail.com
References: <cover.1680954589.git.pengdonglin@sangfor.com.cn>
 <1fc502712c981e0e6742185ba242992170ac9da8.1680954589.git.pengdonglin@sangfor.com.cn>
 <66fe9288-05ff-1bf3-dd40-e7b3cbdf1af9@sangfor.com.cn>
In-Reply-To: <66fe9288-05ff-1bf3-dd40-e7b3cbdf1af9@sangfor.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaH0gfVkJJS0sfHkxNSR1OTlUTARMWGhIXJBQOD1
	lXWRgSC1lBWUpJSlVISVVJTk9VSk9CWVdZFhoPEhUdFFlBWU9LSFVKSktPSEhVSktLVUtZBg++
X-HM-Tid: 0a877ec2d1ccb283kuuu5d0bd580169
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PU06Sgw*Lz0IHiEXNwwuMEIf
	Vi9PCxNVSlVKTUNKT05DQkpLSktLVTMWGhIXVQseFRwfFBUcFxIVOwgaFRwdFAlVGBQWVRgVRVlX
	WRILWUFZSklKVUhJVUlOT1VKT0JZV1kIAVlBSE9CTjcG

On 2023/4/14 15:44, Donglin Peng wrote:
> On 2023/4/8 20:42, Donglin Peng wrote:
>> Analyzing system call failures with the function_graph tracer can be a
>> time-consuming process, particularly when locating the kernel function
>> that first returns an error in the trace logs. This change aims to
>> simplify the process by recording the function return value to the
>> 'retval' member of 'ftrace_graph_ent' and printing it when outputting
> 
> There is a mistake, the retval member is added to ftrace_graph_ret.

Hi Steve, could you please correct this mistake before merging it into
linux-next?

> 
>> the trace log.
>>

