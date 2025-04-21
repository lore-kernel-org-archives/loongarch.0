Received: from out-183.mta0.migadu.com (out-183.mta0.migadu.com [91.218.175.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8211D1ADC93
	for <loongarch@lists.linux.dev>; Mon, 21 Apr 2025 02:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745203197; cv=none; b=IVg0aYvWmj/g1IazDg8641/L9XkJziKWIlzm98MOGbz8Ttrhtt4Zmx6pGk971j7eZiVp2l72hp2J4yE8ddaE1pDy0rAHGHEbKUZIZ8zzr4GuQMMR2x4DBa04ozFiX6PpByrYn1pZb1FY1B4ZCoHdKBeuh03iVh79VdBYBRg6mZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745203197; c=relaxed/simple;
	bh=eYFeHTY456cnnAlTTTkJ8t+cGYlYgpaPNGo3JjXefeU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aMu/Atj26lhN8ZO/+eEHTSGR46CqksztA6A0sjcAd3fX8rbDDAqvg/HQ1r0GuPD2XyQq17ZdxbMNC92j0dMgmWzmK3IDtNa5k4gq2V/3PvpeFDVn1w22Z0wgA48O3gf1el9lf3Tv9j6lmOpgB+wZqI544lBqKij8CVfYUMw6Guk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Avl4VU75; arc=none smtp.client-ip=91.218.175.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Avl4VU75"
Message-ID: <b7154e70-5354-415f-814f-226183fb2f63@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1745203192;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=u50PSTsQUY+tjokYefcMm8pLeb5AZiBEUnXcBDORyCA=;
	b=Avl4VU75kYohuneQCft1AKHIU11w4Fy7kgDHS0FLAI/QSpAfSIzieVKCYmpgLtpF2h3d74
	dpL11azZrP3sFjGH8xo6SN0Om+9B88xqC+yQfcvYU28mOWVVavCK/GbC22flvJJRrOZ7Ix
	KxNhqJl6pNet2ENpv82tOb+ZUYb8Bh0=
Date: Mon, 21 Apr 2025 10:39:01 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: [PATCH 2/3] LoongArch/build: Add fallback install.sh
To: Xi Ruoyao <xry111@xry111.site>, Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev, Youling Tang <tangyouling@kylinos.cn>
References: <20250421020301.34185-1-youling.tang@linux.dev>
 <20250421020301.34185-2-youling.tang@linux.dev>
 <a61ccfc40e80a6b418328718a9d40d28792ef2fa.camel@xry111.site>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Youling Tang <youling.tang@linux.dev>
In-Reply-To: <a61ccfc40e80a6b418328718a9d40d28792ef2fa.camel@xry111.site>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Hi, Ruoyao

On 2025/4/21 10:27, Xi Ruoyao wrote:

> On Mon, 2025-04-21 at 10:03 +0800, Youling Tang wrote:
>> From: Youling Tang <tangyouling@kylinos.cn>
>>
>> As specified in scripts/install.sh, the priority order is
>> as follows (from highest to lowest):
>>    ~/bin/installkernel
>>    /sbin/installkernel
>>    arch/loongarch/boot/install.sh
>>
>> Fallback to default install.sh if installkernel not found.
>>
>> Signed-off-by: Youling Tang <tangyouling@kylinos.cn>
>> ---
>>   arch/loongarch/boot/install.sh | 44
>> ++++++++++++++++++++++++++++++++++
>>   1 file changed, 44 insertions(+)
>>   create mode 100755 arch/loongarch/boot/install.sh
>>
>> diff --git a/arch/loongarch/boot/install.sh
>> b/arch/loongarch/boot/install.sh
>> new file mode 100755
>> index 000000000000..c97f611ca913
>> --- /dev/null
>> +++ b/arch/loongarch/boot/install.sh
>> @@ -0,0 +1,44 @@
>> +#!/bin/sh
>> +#
>> +# This file is subject to the terms and conditions of the GNU General
>> Public
>> +# License.  See the file "COPYING" in the main directory of this
>> archive
>> +# for more details.
>> +#
>> +# Copyright (C) 1995 by Linus Torvalds
>> +#
>> +# Adapted from code in arch/i386/boot/Makefile by H. Peter Anvin
>> +# Adapted from code in arch/i386/boot/install.sh by Russell King
>> +#
>> +# "make install" script for the RISC-V Linux port
>                                     ^^^^^^
>
> Pasto here.
My oversight, I'll revise it later.

Thanks,
Youling.
