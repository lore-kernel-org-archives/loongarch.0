Received: from mailbox.box.xen0n.name (mail.xen0n.name [115.28.160.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43710D31A
	for <loongarch@lists.linux.dev>; Mon,  6 Mar 2023 12:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
	t=1678106108; bh=HggfgfY8EdiohzxhFLjOB3a8s8G1k1yNTX09kIZ4oNE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nSfYFSZ7PHPW5XthM8wIe2Wwh2d4pva72Xtb/RLD7MPD3GbkY+7FFvoRk49wA+yc3
	 3qLv71Y+0xW76BUcxAJ2aBh6WX/4pRelHjrPuhwCIFagw4TOFncsapo4WzsxVPJbwq
	 989sgjRRK+a0xc0AAvNFSkQi6ExgGMFbn38izNDk=
Received: from [100.100.57.122] (unknown [58.34.185.106])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mailbox.box.xen0n.name (Postfix) with ESMTPSA id B33E760B17;
	Mon,  6 Mar 2023 20:35:07 +0800 (CST)
Message-ID: <0c989754-5a8e-72d8-d489-11ed364b91cc@xen0n.name>
Date: Mon, 6 Mar 2023 20:35:07 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH V3] LoongArch: Provide kernel fpu functions
Content-Language: en-US
To: maobibo <maobibo@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>,
 Arnd Bergmann <arnd@arndb.de>, Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev, linux-arch@vger.kernel.org,
 Xuefeng Li <lixuefeng@loongson.cn>, Guo Ren <guoren@kernel.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-kernel@vger.kernel.org,
 loongson-kernel@lists.loongnix.cn
References: <20230306095934.609589-1-chenhuacai@loongson.cn>
 <029a5993-b993-ab73-0a14-0df9b0ddf3da@loongson.cn>
From: WANG Xuerui <kernel@xen0n.name>
In-Reply-To: <029a5993-b993-ab73-0a14-0df9b0ddf3da@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 2023/3/6 20:03, maobibo wrote:
> 
> 
> 在 2023/3/6 17:59, Huacai Chen 写道:
>> Provide kernel_fpu_begin()/kernel_fpu_end() to allow the kernel itself
>> to use fpu. They can be used by some other kernel components, e.g., the
>> AMDGPU graphic driver for DCN.
> Since kernel is compiled with -msoft-float, I guess hw fpu will not be
> used in kernel by present:). However it is deserved to try.

This has been explained by Ruoyao, but we'd need such support anyway 
when we have LSX/LASX support mainlined in the future and want to 
accelerate various algorithms with those instructions. Maybe at that 
time you'll want to port some of those too ;-)

-- 
WANG "xen0n" Xuerui

Linux/LoongArch mailing list: https://lore.kernel.org/loongarch/

