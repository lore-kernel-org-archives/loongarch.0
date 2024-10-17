Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B82FD2194BF
	for <loongarch@lists.linux.dev>; Thu, 17 Oct 2024 20:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729196846; cv=none; b=sg49Lz07XJrol2dODlwFQ03u1ZFPnW+P5h2vkdXPjNtd1frCo7UCx5IYuKVw7yVOYKeGPYJIm9tb++l1Xgk+DSyxQXOqSkO1bDYKTKK0CLk97cCaWdLzAJi46CQWdu5dFVKMpsb2R3csi/ivZ3tvMUYKGi54EaCSrqEOImDwrJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729196846; c=relaxed/simple;
	bh=XQQrB+BqmcD4LcSj1KMeDy2opfoF996hSV6qgCl8kak=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MWNA25VdFfBTiMU2xjatxPbvcExTt2y2qRhaLwZB82bE7e/hq78iB1B92CX4GKC6TGylVpk7t7kT8n3fmmMax8BvCXgA6pbNf2Lnh82ZDqPnkIJ3F1Xfngsfnz5VedDsx+321sH7BXO/bltPJ4WoCNTB2itQCGjjCxwn4g3HZ20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=SaPUCidQ; arc=none smtp.client-ip=209.85.166.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="SaPUCidQ"
Received: by mail-io1-f48.google.com with SMTP id ca18e2360f4ac-8323b555a6aso80710639f.3
        for <loongarch@lists.linux.dev>; Thu, 17 Oct 2024 13:27:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1729196840; x=1729801640; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0S5MPorG8STFHi4ZHKupmmCHSXBZxKErXkagXcshGng=;
        b=SaPUCidQE5juBZO+0gN/6kEGRgTITX6xpEtvCdO8jCxaRQ/n/1ngpj2ZkwwZm1d3b7
         BeWg7tw9gq7qHd8FIYrlYh7ASTt06mvsH42C20Hh575COtt/HQof6E0JYsOmMfEcfX38
         RZ2eu8kOb1xEgv7oa5lSbJWgbeWdByQogg9Gg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729196840; x=1729801640;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0S5MPorG8STFHi4ZHKupmmCHSXBZxKErXkagXcshGng=;
        b=c4F1MMiroel+pUPkaab2HEczoyjvhy1SuzVkbmDXFzkZ8yr6QNDWsD5ZvNp4niysbi
         qKH7RZGOX8zmvrNkQHsWjcqyEyG8qKqK+aBzZp+mnUvuqvTzfdNSJy0i0OBJ+kY2T6bJ
         6cu1gNk8LnjH1iwC+8QtH2g8RdDtkLqTJORhlMPFRORj+4pKBf/w/D7q3FiGxqhHTUrS
         rFnkIDz9/jQDeiTz4OOWaMDzsbBpeOpjqz7SV/rsKQCisLLI5bkAn1GTXpBvHHUbSq3e
         tWYAqlZqmOPh0bbApwKJQhnV6PB9BH+bBh671oUaw3M/n1NUT9gPyn+jJCPmOctv2emG
         RJAA==
X-Gm-Message-State: AOJu0YyExO+ulv3tj7Oj5viP1G6NriKq+WWRPdAzz8k6G97LThW48sEY
	iWRvwaaeqgZCwp5bGge7l5tWGSaXxl5bbPO2FoH2zkmueyzIYtFur7gh5YOTTFk=
X-Google-Smtp-Source: AGHT+IGDaL6jHQzbs+8GZfOyqS4uzH8LkR/xzgp5DkEAqRKTqgwzskUM+ylwLNVAshxcMDeXjcSh1Q==
X-Received: by 2002:a05:6602:6007:b0:83a:b188:7a4d with SMTP id ca18e2360f4ac-83aba3054b7mr10651939f.0.1729196839721;
        Thu, 17 Oct 2024 13:27:19 -0700 (PDT)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4dc10c67b05sm41578173.157.2024.10.17.13.27.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Oct 2024 13:27:19 -0700 (PDT)
Message-ID: <878d5f26-ef05-44f4-93e8-01f66088c0cc@linuxfoundation.org>
Date: Thu, 17 Oct 2024 14:27:18 -0600
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] kunit: qemu_configs: add LoongArch config
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Brendan Higgins <brendan.higgins@linux.dev>, David Gow
 <davidgow@google.com>, Rae Moar <rmoar@google.com>
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20241014-kunit-loongarch-v1-0-1699b2ad6099@linutronix.de>
 <20241014-kunit-loongarch-v1-2-1699b2ad6099@linutronix.de>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20241014-kunit-loongarch-v1-2-1699b2ad6099@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Thomas,

On 10/14/24 05:36, Thomas Weißschuh wrote:
> Add a basic config to run kunit tests on LoongArch.
> This requires QEMU 9.1.0 or later for the necessary direct kernel boot
> support.
> 
> Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
> ---
>   tools/testing/kunit/qemu_configs/loongarch.py | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
> 
> diff --git a/tools/testing/kunit/qemu_configs/loongarch.py b/tools/testing/kunit/qemu_configs/loongarch.py
> new file mode 100644
> index 0000000000000000000000000000000000000000..e7bb7c07819677dfdefac012821a732555813cae
> --- /dev/null
> +++ b/tools/testing/kunit/qemu_configs/loongarch.py

Missing SPDX-License-Identifier.

> @@ -0,0 +1,16 @@
> +from ..qemu_config import QemuArchParams
> +
> +QEMU_ARCH = QemuArchParams(linux_arch='loongarch',
> +			   kconfig='''
> +CONFIG_EFI_STUB=n
> +CONFIG_PCI_HOST_GENERIC=y
> +CONFIG_SERIAL_8250=y
> +CONFIG_SERIAL_8250_CONSOLE=y
> +CONFIG_SERIAL_OF_PLATFORM=y
> +''',
> +			   qemu_arch='loongarch64',
> +			   kernel_path='arch/loongarch/boot/vmlinux.elf',
> +			   kernel_command_line='console=ttyS0',
> +			   extra_qemu_params=[
> +					   '-machine', 'virt',
> +					   '-cpu', 'max',])
> 

Please send v2 with all the reviewed by tags. If there
is a resend 3.4 and 4/4 in this series, send them.

thanks,
-- Shuah


