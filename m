Received: from mailbox.box.xen0n.name (mail.xen0n.name [115.28.160.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A89ED1632FB
	for <loongarch@lists.linux.dev>; Fri, 24 Jan 2025 16:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.28.160.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737735059; cv=none; b=VTWUbcb3P2TdtKc0tDkyODYp4IX75H8dH5YHKR8LuNvB/irVqbzQGRgMIuc/KO4P6nadg0g86ExbmTbmCzfAf67X2BOIDuptnMaa7CwSzskrOzMejX9sfP5LlXA6Eo8gEBY6naIaCmlvEUQyOS4x4JCoPRinzbLTjjAY0kMYkwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737735059; c=relaxed/simple;
	bh=Kv8RG3KW9AyJZLl7HNDHtFdMTHCf6rEwQ5O4ftua2NI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i+jTc/VPAjSJUnFAwtJumAPkpiWhUgxWh38RCYaf9hNueznc5J/ElCVCHOoNWYZbSvraAtNNDhD2C3fpYdUjxQeEcz40bn+uyzZoa5ZuuP8IBVZpE3MQ8fhPDe+xwZL/ntqbGRzoNeu40gfYPurcT0MrDTNq0P/J2wAAGZTZOZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=xen0n.name; spf=pass smtp.mailfrom=xen0n.name; dkim=pass (1024-bit key) header.d=xen0n.name header.i=@xen0n.name header.b=MECPeR+0; arc=none smtp.client-ip=115.28.160.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=xen0n.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xen0n.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xen0n.name header.i=@xen0n.name header.b="MECPeR+0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
	t=1737735054; bh=Kv8RG3KW9AyJZLl7HNDHtFdMTHCf6rEwQ5O4ftua2NI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MECPeR+0wZh3qtfMsl/JJV69Ui6khzvX7YtOWXZsxeR7mGSUkz+JAaWrAcQDAS0U+
	 MX+4+hNIQHUldjTMEYiIbZzinS56h1Z4+8kvzuyyajTdKAd/HQnVLSqyETl9rMvECq
	 yzQviQ4M/pOMQ6sEQ7AgcR+d3xQyEufPTojkxu20=
Received: from [IPV6:240e:388:8d02:a200:2a38:a5d2:3af7:ba8f] (unknown [IPv6:240e:388:8d02:a200:2a38:a5d2:3af7:ba8f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 681996012F;
	Sat, 25 Jan 2025 00:10:54 +0800 (CST)
Message-ID: <191d85a5-c801-49d6-890c-f3c8e5e7f3ef@xen0n.name>
Date: Sat, 25 Jan 2025 00:10:54 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] LoongArch: Extend the maximum number of
 watchpoints
To: Tiezhu Yang <yangtiezhu@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250122032310.26729-1-yangtiezhu@loongson.cn>
 <20250122032310.26729-3-yangtiezhu@loongson.cn>
Content-Language: en-US
From: WANG Xuerui <kernel@xen0n.name>
In-Reply-To: <20250122032310.26729-3-yangtiezhu@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/22/25 11:23, Tiezhu Yang wrote:
> The maximum number of load/store watchpoints and fetch instruction
> watchpoints is 14 each according to LoongArch Reference Manual, so
> extend the maximum number of watchpoints from 8 to 14 for ptrace.
> 
> By the way, just simply change 8 to 14 for the definition in struct
> user_watch_state at the beginning, but it may corrupt uapi, then add
> a new struct user_watch_state_v2 directly.
> 
> As far as I can tell, the only users for this struct in the userspace
> are GDB and LLDB, there are no any problems of software compatibility
> between the application and kernel according to the analysis.
> 
> The compatibility problem has been considered when developing and testing
> the patches, when the applications in the userspace get watchpoint state,
> the length will be specified which will not bigger than the sizeof struct
> user_watch_state or user_watch_state_v2, the actual length is assigned as
> the minimal value of the application and kernel in the generic ptrace:
> 
> kernel/ptrace.c: ptrace_regset():
> 
> 	kiov->iov_len = min(kiov->iov_len,
> 			    (__kernel_size_t) (regset->n * regset->size));
> 
> 	if (req == PTRACE_GETREGSET)
> 		return copy_regset_to_user(task, view, regset_no, 0,
> 					   kiov->iov_len, kiov->iov_base);
> 	else
> 		return copy_regset_from_user(task, view, regset_no, 0,
> 					     kiov->iov_len, kiov->iov_base);
> 
> For example, there are four kind of combinations, all of them work well.
> 
> (1) "older kernel + older gdb", the actual length is 8+(8+8+4+4)*8=200;
> (2) "newer kernel + newer gdb", the actual length is 8+(8+8+4+4)*14=344;
> (3) "older kernel + newer gdb", the actual length is 8+(8+8+4+4)*8=200;
> (4) "newer kernel + older gdb", the actual length is 8+(8+8+4+4)*8=200.
> 
> Link: https://loongson.github.io/LoongArch-Documentation/LoongArch-Vol1-EN.html#control-and-status-registers-related-to-watchpoints
> Fixes: 1a69f7a161a7 ("LoongArch: ptrace: Expose hardware breakpoints to debuggers")
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---
>   arch/loongarch/include/uapi/asm/ptrace.h | 10 ++++++++++
>   arch/loongarch/kernel/ptrace.c           |  6 +++---
>   2 files changed, 13 insertions(+), 3 deletions(-)

Looks good now with the UAPI stability analysis:

Reviewed-by: WANG Xuerui <git@xen0n.name>

-- 
WANG "xen0n" Xuerui

Linux/LoongArch mailing list: https://lore.kernel.org/loongarch/
