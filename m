Received: from out203-205-221-245.mail.qq.com (out203-205-221-245.mail.qq.com [203.205.221.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 994C2405ADE
	for <loongarch@lists.linux.dev>; Tue, 24 Mar 2026 15:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774365829; cv=none; b=PXFkDtDREX5NPIS+F+6XDLu37ZZrBkkKIsfT4jT0NkloE28A7tbgAeajQ6EQGjTIxw19ftBagGSpafZJ/i03xAlqpYRQQlUoDsbzEyVnbwqotrxIDmJ22jsEzd6SbqkkJQZIYrb49pf26dhBgzRvbS/yW1OHI7eF+IA+FLCUdWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774365829; c=relaxed/simple;
	bh=P4frT3gz7jlvVZkFCWYN3FtXDad6p5QMr9RqrMj39YY=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=SjsbAKPmGxY+TmWiPIEqR+pmIm8RNwwYDDzw0QW+15Xf4JEz8uPLMYj7JndgYeOVJmYU8rJDf2pjGxmHERLMEq/QO82EbApL4ALX4dTWKJkbcwuAZaDW8jJKC2LxjmRtVvruWROVFV6tpCLMcspxmCK5LwxV7Y86758ysIUHiMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=UU0EC8nn; arc=none smtp.client-ip=203.205.221.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="UU0EC8nn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1774365819; bh=P4frT3gz7jlvVZkFCWYN3FtXDad6p5QMr9RqrMj39YY=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To;
	b=UU0EC8nnNMEYMp6mJGuJuqPs4ti5vtNP3aVyqO4xztqN44W9Zv92G9fzGOQryPKXw
	 fiKXLqMnwgknpz+GjOFliZ5WoNhgCdDkWEW9t+W/+/zMFfMMCLAKIafctRnwfbx+tp
	 5AqnqNbXS8Qt7T3ekX+rEEJp//DYZmqSscfUBu4k=
Received: from [198.18.0.1] ([122.195.139.226])
	by newxmesmtplogicsvrszc43-0.qq.com (NewEsmtp) with SMTP
	id 5E53EE37; Tue, 24 Mar 2026 23:23:37 +0800
X-QQ-mid: xmsmtpt1774365817tbuo90a9u
Message-ID: <tencent_E4D1B4064002D5AF59AA0BAD54EFE9885707@qq.com>
X-QQ-XMAILINFO: NX3IH4pixvQA7ciSWzquRTMM9LyN2HL1jADOG0NX5loOszCUOpFEcut74oVUuF
	 jMvl8RqbmXREMk0o+IRY97K9SnV6T1VXEJE6/vowtmj3InRmiCNUqhu2LAYNSPIs+7SuPoPlnmnW
	 gg6dOmkKsoZ/krmUm14o5fHkpCaYEyXrC+kevu6iNVncskudUg9o7BBsWVF3qPA7C1ke5BUKBUqY
	 ELOgYH9UNUctxIc5ubcoayCsJXEF/AtN96bP3iY1/vT8/VmhZH9dJzgXUWqZzWLHQgnN5FeVkShE
	 87FZBJs0JDr/g20luG6bm991aYWurfoSzXKT9cGIUho3j7D9LgdqOUT7PuDEvsvQpme5rTScr9gZ
	 4gNUwGi47L2ylsuc301eLJTqu6UDmDGKuXqFZ7IxVMMVbPIBwa7UJFHIp8+FPfqlZ15bDi9GGu2r
	 3P6uLba6TmClff7FCvFQJxU//9fNx+ENa4a06NbM0MzTRkWiGJ/Vuie74KcOyTsr3+m8oopHenUC
	 dE1zHKSzhqeOo9SuYAVk2zvejkORonJMUbJLEDpqH2w1iZaxy/jJN4rV/LJqveV+PbfKiZU/RgCY
	 0r7xUlmu3F2G7ad8+80BlAM+j/hFLFwuEAr+ihBLHBTO6BDlzaEiBkyqxe5OzOGoKvilePT3v10F
	 7DipBBf2qko5bn6mhAeMCIxewo/BUsuR4DAlAsLuTdJtjGNXP0CXRdxmniF3SH00VKGz+zSHajjV
	 DojOW1CRzezog2+7xmqndHDP8GY9ddH9mq8DBZz5SiIq5IIxvSdupjuK18HoYQT+nh689qKe08hZ
	 ig+CuTXdHJCCgMbjIHCc3Z9ciGK2oug8MELOTKgBhmMkCEjyCgilNRTWrz+7C6WX+/aUIVdtuhQh
	 pFEcJGqcWhQerGBap9eMkyA+xnCn7qv+6WU3TV16WztCoZ79gd9viOnw10Ek3egyv6FtBleVdSVL
	 4qtdynAdXWTfpVfYEBdfyNzL6VhThzqyKBsaTQNuiHgCsnJLD7qRJvIUjdtlwQcLqhwI1ANOomds
	 LeY90Fn+yFC9azRvNRQAEkrAx/ZlI=
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
X-OQ-MSGID: <6a5f98c1-331b-4958-93b1-5277572a7d22@qq.com>
Date: Tue, 24 Mar 2026 23:23:36 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/2] Add Loongson-2K0300 processor support
From: wjjsn <wjjsn@qq.com>
To: Yao Zi <me@ziyao.cc>, Huacai Chen <chenhuacai@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 kernel@xen0n.name, devicetree@vger.kernel.org, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org, wjjsn <2858482031@qq.com>
References: <tencent_325FB1D2C600CD55E367332EC453E5A64B09@qq.com>
 <ab_iF2hjZRfp16HP@pie>
 <CAAhV-H7FZ65D9mHgW8_-_QiZ2Kv2cxVo5P72AJhc3JptviFpNA@mail.gmail.com>
 <tencent_CA7176E8823B957F1AEB15254D17904D5505@qq.com> <acCoo_ZrTmZGZH5d@pie>
 <tencent_414FBFBEE2A4510232AB52CE665C04A6C20A@qq.com>
Content-Language: en-US
In-Reply-To: <tencent_414FBFBEE2A4510232AB52CE665C04A6C20A@qq.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 3/24/26 23:09, wjjsn wrote:
> On 3/23/26 10:42, Yao Zi wrote:
>> On Mon, Mar 23, 2026 at 12:33:31AM +0800, wjjsn wrote:
>>> On 3/22/26 21:15, Huacai Chen wrote:
>>> 1. The current clock driver in mainline has some problems.
>>>    The pll_ddr is lower than the user_manual,
>>

Sorry for the formatting issues and
the messed up attribution in my previous mail.
﻿
The statement
"1. The current clock driver in mainline has some problems..."
was actually my observation, not Huacai's.

Also, I apologize for the long lines;
I will fix my mail client's line-wrapping settings for future discussions.
﻿
Regards,
wjjsn

