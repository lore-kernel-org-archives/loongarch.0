Received: from mailbox.box.xen0n.name (mail.xen0n.name [115.28.160.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F34373201
	for <loongarch@lists.linux.dev>; Fri, 17 Jun 2022 14:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
	t=1655474511; bh=3gTfTUyRx7JS93jYCT+yHnHbtQ9UgXa4K5Ok63yX2pI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nPxlZoFtYLyg3BFJLc+ZrV5WqZiupz8CbyRrridPvvM+KQWQC7hZ69ltTYjy5YeEI
	 Jc9twvjOyYvsVxfgByrP1Iq1tQUtZyyKo14+DHsJBQsFl72qQOhfyt2LbnOJFz6rSJ
	 Vv479KfyVVkCSLB569wQxy5zpQxwcZ+GG4PmXsbQ=
Received: from [192.168.9.172] (unknown [101.88.28.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 9E1DF600FF;
	Fri, 17 Jun 2022 22:01:51 +0800 (CST)
Message-ID: <528f8ab7-d9cc-9926-43a4-17c31d97ed6e@xen0n.name>
Date: Fri, 17 Jun 2022 22:01:51 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:103.0) Gecko/20100101
 Thunderbird/103.0a1
Subject: Re: [PATCH v4 2/2] docs/zh_CN/LoongArch: Fix notes rendering by using
 reST directives
To: Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
 alexs@kernel.org, bobwxc@email.cn, seakeel@gmail.com
Cc: corbet@lwn.net, kernel@xen0n.name, jiaxun.yang@flygoat.com,
 linux-doc@vger.kernel.org, siyanteng01@gmail.com, loongarch@lists.linux.dev
References: <cover.1655469906.git.siyanteng@loongson.cn>
 <6b96845497e7f2a33708d002ef93c01e29b84bfc.1655469906.git.siyanteng@loongson.cn>
Content-Language: en-US
From: WANG Xuerui <kernel@xen0n.name>
In-Reply-To: <6b96845497e7f2a33708d002ef93c01e29b84bfc.1655469906.git.siyanteng@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/17/22 20:47, Yanteng Si wrote:
> Notes are better expressed with reST admonitions.
Okay.
>
> Fixes: f23b22599f8e ("Documentation/zh_CN: Add basic LoongArch documentations")
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> ---
>   .../translations/zh_CN/loongarch/introduction.rst  | 14 ++++++++------
>   .../zh_CN/loongarch/irq-chip-model.rst             | 14 ++++++++------
>   2 files changed, 16 insertions(+), 12 deletions(-)
>
> diff --git a/Documentation/translations/zh_CN/loongarch/introduction.rst b/Documentation/translations/zh_CN/loongarch/introduction.rst
> index e31a1a928c48..11686ee0caeb 100644
> --- a/Documentation/translations/zh_CN/loongarch/introduction.rst
> +++ b/Documentation/translations/zh_CN/loongarch/introduction.rst
> @@ -46,10 +46,11 @@ LA64中每个寄存器为64位宽。 ``$r0`` 的内容总是固定为0，而其
>   ``$r23``-``$r31`` ``$s0``-``$s8`` 静态寄存器          是
>   ================= =============== =================== ==========
>   
> -注意：``$r21``寄存器在ELF psABI中保留未使用，但是在Linux内核用于保存每CPU
> -变量基地址。该寄存器没有ABI命名，不过在内核中称为``$u0``。在一些遗留代码
> -中有时可能见到``$v0``和``$v1``，它们是``$a0``和``$a1``的别名，属于已经废弃
> -的用法。
> +.. note::
> +    注意： ``$r21`` 寄存器在ELF psABI中保留未使用，但是在Linux内核用于保
> +    存每CPU变量基地址。该寄存器没有ABI命名，不过在内核中称为 ``$u0`` 。在
> +    一些遗留代码中有时可能见到 ``$v0`` 和 ``$v1`` ，它们是 ``$a0`` 和
> +    ``$a1`` 的别名，属于已经废弃的用法。
>   
>   浮点寄存器
>   ----------
> @@ -68,8 +69,9 @@ LA64中每个寄存器为64位宽。 ``$r0`` 的内容总是固定为0，而其
>   ``$f24``-``$f31`` ``$fs0``-``$fs7``  静态寄存器          是
>   ================= ================== =================== ==========
>   
> -注意：在一些遗留代码中有时可能见到 ``$v0`` 和 ``$v1`` ，它们是 ``$a0``
> -和 ``$a1`` 的别名，属于已经废弃的用法。
> +.. note::
> +    注意：在一些遗留代码中有时可能见到 ``$v0`` 和 ``$v1`` ，它们是
> +    ``$a0`` 和 ``$a1`` 的别名，属于已经废弃的用法。
>   
>   
>   向量寄存器
> diff --git a/Documentation/translations/zh_CN/loongarch/irq-chip-model.rst b/Documentation/translations/zh_CN/loongarch/irq-chip-model.rst
> index 2a4c3ad38be4..fb5d23b49ed5 100644
> --- a/Documentation/translations/zh_CN/loongarch/irq-chip-model.rst
> +++ b/Documentation/translations/zh_CN/loongarch/irq-chip-model.rst
> @@ -147,9 +147,11 @@ PCH-LPC::
>   
>     https://github.com/loongson/LoongArch-Documentation/releases/latest/download/Loongson-7A1000-usermanual-2.00-EN.pdf (英文版)
>   
> -注：CPUINTC即《龙芯架构参考手册卷一》第7.4节所描述的CSR.ECFG/CSR.ESTAT寄存器及其中断
> -控制逻辑；LIOINTC即《龙芯3A5000处理器使用手册》第11.1节所描述的“传统I/O中断”；EIOINTC
> -即《龙芯3A5000处理器使用手册》第11.2节所描述的“扩展I/O中断”；HTVECINTC即《龙芯3A5000
> -处理器使用手册》第14.3节所描述的“HyperTransport中断”；PCH-PIC/PCH-MSI即《龙芯7A1000桥
> -片用户手册》第5章所描述的“中断控制器”；PCH-LPC即《龙芯7A1000桥片用户手册》第24.3节所
> -描述的“LPC中断”。
> +.. note::
> +    - CPUINTC：即《龙芯架构参考手册卷一》第7.4节所描述的CSR.ECFG/CSR.ESTAT寄存器及其
> +      中断控制逻辑；
> +    - LIOINTC：即《龙芯3A5000处理器使用手册》第11.1节所描述的“传统I/O中断”；
> +    - EIOINTC：即《龙芯3A5000处理器使用手册》第11.2节所描述的“扩展I/O中断”；
> +    - HTVECINTC：即《龙芯3A5000处理器使用手册》第14.3节所描述的“HyperTransport中断”；
> +    - PCH-PIC/PCH-MSI：即《龙芯7A1000桥片用户手册》第5章所描述的“中断控制器”；
> +    - PCH-LPC：即《龙芯7A1000桥片用户手册》第24.3节所描述的“LPC中断”。

Reviewed-by: WANG Xuerui <git@xen0n.name>

Thanks!

