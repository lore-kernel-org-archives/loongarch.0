Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3E151917E9
	for <loongarch@lists.linux.dev>; Sun,  8 Dec 2024 20:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733689340; cv=none; b=LAUcm4moAUIRaDpF0p+srrE1QTTNIeF9YD7jxzY+edC7HHclUlROojO3ew5AbJO0w3OV7JFAr9kQVm6GRopL4gB/WX1tHDxDrGSX3YbOffORDsKE5VjNNtp0wdJgtRs8QeNS0U9UQX+zp6LD896OBRWrQGHiMMXFS2JKpcIgiZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733689340; c=relaxed/simple;
	bh=XEYRwMnet+r825nSM/cLYqyePethGAWl739j+BAGgIo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=N8NFJ8x85Xa9/lcpCiBo0KYE0shLyFQ2tXHMA72uZ+AU7XubGRvoD4mjJ6D5bseWTs4fjlrRegXPdpZos4/UIsx8O9KOe/6++kYdnJIe3pZ5evt9fBNcppLsSbo0PpxARGkkYwHMW81QANOPshjfSiAryO2iwr8WffvGdB+rkko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=sML6Jew3; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=KOKJxPpr; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="sML6Jew3";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="KOKJxPpr"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1733689337;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GEwHm4RjPwsEsy6MSACHhlpzhxhayGl7iXcDVkZS/vE=;
	b=sML6Jew3YPmWDyO5lPXBHfu9LLs2SsTjquepGfC1DIlh4w5wlQ5W77HhcxKH8aI35yiKNU
	jl5eL38zYn/WhmPYLgTPru3vHpJrs8kn4pEDjOm1HnEwu5S21eOIHisI7e9oMtOjt1objP
	5j9ImyS2yDpdZVjpa6iC2cwErM6uIxcKN7rBymqbBIMeadkg9rS2EWtE7E3kvNJZ7wkUGB
	easKIie2nb5MfVzdamJ7KyyBmXc/6I6F+vGr1zWQaTvlG5UaHrVhT18VsICAChemfUPgOa
	qQM6WNG7ZzvcTMAlmG+TBOvbRA4I8V4E/Wu7A8mW1XPA2damcN1aFkdtqys+MQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1733689337;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GEwHm4RjPwsEsy6MSACHhlpzhxhayGl7iXcDVkZS/vE=;
	b=KOKJxPprxJ2zqEcww/Hvti+UJDiBwwUMD7UOkYPp4oJB9yIVw+4yOjp5zLUxqVPSOVUvFB
	5LMz6zhJ+huB3rCQ==
To: Huacai Chen <chenhuacai@kernel.org>, Tianyang Zhang
 <zhangtianyang@loongson.cn>
Cc: kernel@xen0n.name, loongarch@lists.linux.dev, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] irqchip/loongarch-avec:Add multi-nodes topology support
In-Reply-To: <CAAhV-H4VAyD+=Btt9S6HrN6-sVQJqe1_jeLPS13UR1kxXJ8S5w@mail.gmail.com>
References: <20241207033146.20938-1-zhangtianyang@loongson.cn>
 <CAAhV-H4VAyD+=Btt9S6HrN6-sVQJqe1_jeLPS13UR1kxXJ8S5w@mail.gmail.com>
Date: Sun, 08 Dec 2024 21:22:16 +0100
Message-ID: <8734iyq613.ffs@tglx>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 07 2024 at 17:11, Huacai Chen wrote:
> On Sat, Dec 7, 2024 at 11:31=E2=80=AFAM Tianyang Zhang
> <zhangtianyang@loongson.cn> wrote:
>>
>> This patch enables the advanced interrupt controller function under
>> multiple-node of 3C600. The topology of the advanced interrupt controller
>> is consistent with NUMA node. We check the enable status of the node whe=
re
>> each CPU is located once when it goes online, which may cause some
>> additional operations, but it can ensure that the advanced interrupt
>> controller can still be used in situations where some CPUs cannot start
> The whole can be reworded:
>
> Currently we only enable one chip's advanced interrupt controller
> (AVEC) in hardware, so multi-chip machines with Loongson-3C6000 don't
> work. This patch enables it for every chip (In theory every chip needs
> to be enabled only once, but for simplicity we enable it on every core
> in the CPU online hooks).

It want's to be reworded without 'we' and 'this patch':

  avecintc_init() enables the Advanced Interrupt Controller (AVEC) of
  the boot CPU node, but nothing enables the AVEC on secondary nodes.

  Move the enablement to the CPU hotplug callback so that secondary
  nodes get the AVEC enabled too. In theory enabling it once per node
  would be sufficient, but redundant enabling does no hard, so keep the
  code simple and do it unconditionally.

Thanks,

        tglx
