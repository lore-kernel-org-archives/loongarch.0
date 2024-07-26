Received: from smtpbgjp3.qq.com (smtpbgjp3.qq.com [54.92.39.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D077442F
	for <loongarch@lists.linux.dev>; Fri, 26 Jul 2024 03:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.92.39.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721963409; cv=none; b=QxtmyQCLWTp61sV5Ex4hxiX+WH6ts8vok7AYPi7XgHw5BSOEfAy3KYhlrQ33PP3KSfNpkTz6/lqXRHOWhZcwH9VvdNxPKllaYwtvK9dt7VzLrghucCJnZW4PjpNYUauuJA/TDg6/H8i8rUixeDc/dWpkCSsGRx0F9qkniy3LPR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721963409; c=relaxed/simple;
	bh=KnmhnJYYwGpkztXvAAhQ7H65oKgoi/1LJQ1oRyzvwF0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tyX/c1Z4T7uzWkTmzqa0jgFZVQAoEve8GDA+XTPQ+KLGB5HG/tL94ZYRTT7ngSECHrkj9WSYb9/TpctXSUSgml7Kohz/0qvlEs+Uzqh4FQfHbQSqSFhUa3H6Cgr/avnQDyqQPPs+InhpFS/AjaQ64SGHQEMcQKtGsF3FjuTuFt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; arc=none smtp.client-ip=54.92.39.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
X-QQ-mid: bizesmtpsz10t1721963365t3n0or
X-QQ-Originating-IP: Xp/t7bt6kuXPtAGBYlF0Pf3MCFZXF14mFhYnaXWuoYI=
Received: from [10.20.251.167] ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 26 Jul 2024 11:09:23 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 12097295247028987170
Message-ID: <378701EAC462BD03+7e3108aa-7289-4b3a-8ebf-013dd9ab6e74@uniontech.com>
Date: Fri, 26 Jul 2024 11:09:13 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] KVM: Loongarch: Remove undefined a6 argument comment for
 kvm_hypercall
To: Huacai Chen <chenhuacai@kernel.org>, maobibo <maobibo@loongson.cn>
Cc: Dandan Zhang <zhangdandan@uniontech.com>, zhaotianrui@loongson.cn,
 kernel@xen0n.name, kvm@vger.kernel.org, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org, Wentao Guan <guanwentao@uniontech.com>,
 lixianglai@loongson.cn
References: <6D5128458C9E19E4+20240725134820.55817-1-zhangdandan@uniontech.com>
 <c40854ac-38ef-4781-6c6b-4f74e24f265c@loongson.cn>
 <CAAhV-H5R_kamf=YJ62hb+iFr7Y+cvCaBBrY1rdk_wEEq4+6D_w@mail.gmail.com>
From: WangYuli <wangyuli@uniontech.com>
In-Reply-To: <CAAhV-H5R_kamf=YJ62hb+iFr7Y+cvCaBBrY1rdk_wEEq4+6D_w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpsz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1


On 2024/7/26 10:55, Huacai Chen wrote:
> On Fri, Jul 26, 2024 at 9:49 AM maobibo <maobibo@loongson.cn> wrote:
>
> Maybe it is better to implement kvm_hypercall6() than remove a6 now?
>
It seems that The LoongArch KVM implementation does not include a 
kvm_hypercall6() function.

This might be a typo or an oversight.


Link: 
https://github.com/deepin-community/kernel/blob/linux-6.6.y/Documentation/virt/kvm/loongarch/hypercalls.rst 


