Received: from mailbox.box.xen0n.name (mail.xen0n.name [115.28.160.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 068CA1922F9
	for <loongarch@lists.linux.dev>; Fri, 24 Jan 2025 16:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.28.160.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737735095; cv=none; b=tWCtrFABxTdh0FMwC+GAC64TL3jeJjiRiGwj39scS4QiZ2Awk2i+SW3PfwvoLu1mMR/gwYyEm3d7GPV+zP+u+v4I215gccG0T+5fr48NoaT6HvXD8Jat/By5f1nMeYgwCYlX2FqyLOATx5UZzKkrdrjbZrMcN7FQF9U1tBrnr2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737735095; c=relaxed/simple;
	bh=u6s5w0FfFG2PHEMVJ/8B0V4eAH997ctuykoE6YqBCqk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=quYp2m91LS+Aob3oTRILarrFnPoS0Z7pJwuY/9ZjniD/RqSrWBlHeHVRlwQ6XbRtVT3I9TLpagHyQVIxhdGjlDtT85Gg94rCVk6qZd3n1lOsNdWRD6x6iey2Z3qPqTktklgShmW3ih2DapWHNHjw4OT2Gutj1uaf/3gI//tfdD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=xen0n.name; spf=pass smtp.mailfrom=xen0n.name; dkim=pass (1024-bit key) header.d=xen0n.name header.i=@xen0n.name header.b=N8aAqkQs; arc=none smtp.client-ip=115.28.160.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=xen0n.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xen0n.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xen0n.name header.i=@xen0n.name header.b="N8aAqkQs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
	t=1737735091; bh=u6s5w0FfFG2PHEMVJ/8B0V4eAH997ctuykoE6YqBCqk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=N8aAqkQsfPh/dCp107NIiBSz8bjpzGvXlLo3W6O5YPk9trec/G/XDdmXMPCph9ACe
	 KO9UtFrfVRYysquHSMKBW8dEJ46p3obeSp4ERiFi1x2V7tRqovO07pcZgx5j3wtdV4
	 1aDmFbqEXXJ1yjW0ZA901+OPeS39YFYCSELMq0WY=
Received: from [IPV6:240e:388:8d02:a200:2a38:a5d2:3af7:ba8f] (unknown [IPv6:240e:388:8d02:a200:2a38:a5d2:3af7:ba8f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 35AF06012F;
	Sat, 25 Jan 2025 00:11:31 +0800 (CST)
Message-ID: <e7fb4ba2-57fd-48e0-bf86-64741236a0ad@xen0n.name>
Date: Sat, 25 Jan 2025 00:11:30 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] LoongArch: Change 8 to 14 for
 LOONGARCH_MAX_{BRP,WRP}
To: Tiezhu Yang <yangtiezhu@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250122032310.26729-1-yangtiezhu@loongson.cn>
 <20250122032310.26729-2-yangtiezhu@loongson.cn>
Content-Language: en-US
From: WANG Xuerui <kernel@xen0n.name>
In-Reply-To: <20250122032310.26729-2-yangtiezhu@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/22/25 11:23, Tiezhu Yang wrote:
> The maximum number of load/store watchpoints and fetch instruction
> watchpoints is 14 each according to LoongArch Reference Manual, so
> change 8 to 14 for the related code.
> 
> Link: https://loongson.github.io/LoongArch-Documentation/LoongArch-Vol1-EN.html#control-and-status-registers-related-to-watchpoints
> Fixes: edffa33c7bb5 ("LoongArch: Add hardware breakpoints/watchpoints support")
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---
>   arch/loongarch/include/asm/hw_breakpoint.h |  4 +-
>   arch/loongarch/include/asm/loongarch.h     | 60 ++++++++++++++++++++++
>   arch/loongarch/kernel/hw_breakpoint.c      | 16 +++++-
>   3 files changed, 76 insertions(+), 4 deletions(-)

Reviewed-by: WANG Xuerui <git@xen0n.name>

-- 
WANG "xen0n" Xuerui

Linux/LoongArch mailing list: https://lore.kernel.org/loongarch/
