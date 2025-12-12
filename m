Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC2D8219FC
	for <loongarch@lists.linux.dev>; Fri, 12 Dec 2025 01:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765502312; cv=none; b=GIjLqrNesEn4okx+6zaSKe+nmF2YxlWvkOsYmX1lFNBt8K4HPGP+Rg9pP00NPTNlxVIfFZWXVb4//Jh69iAjEFfFjfMqF3tPVjYD6enrc+V/vtw/h5y8phCgrioBn9iuEt2dX1eYeJnf+nzoeIs+TPwwneWKkvqJ5+XwXwAL4LU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765502312; c=relaxed/simple;
	bh=F7O0b49A2z/BClPaVqAy4fYSB/T+PuumHBt6DSAoBfQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=n6Yf+HgrYOtLOyLp5Tp/dUZcL3qSvspiQ46ep2dhaiQq0wy0/HNvrQxmaUOOlG7FdJ5hHpd+tpdS9Kgge3EU8zcwSZvvQkQSuBbZktAZsMc7mB4599i+Pp1n8CIzuy3IPQ6jJHAyWv/A0MhRLCI023NjueFav7fFnSj5Fl6NRvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=daCK5Uc+; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=qhXVNWjD; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="daCK5Uc+";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="qhXVNWjD"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1765502309;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=e/cEI7EOH824SWxyXgvqDg5xmc4eBhX6iWMr8sE3QN8=;
	b=daCK5Uc+098x1SGaa+JnFX2t/1C1HdG3geQ3Ed8qJnw1hI3M0uyAi2wXXwzvYMABy2HN8L
	io+9R2a9wZV2Fx8KOqWdOhGy2lgTCV3s7MOftc5ULtiSAOkZ3PqR+dz/jhv2F1jGgW+5jQ
	G1O05AikHz2HujbUlBnavQZj3LYZaTMSiR5EiN9Ngde6ACATKLAqkComEaU3WqGxb670Hn
	hPzGJrGD2cWZgnjG0Wz1S+5Jox1YEazNnEbDCIGCzjWKrrqjJ2PbTn6T1Q1TwHtuxjsOm9
	4Hwx6UGvjI6osF6QROPR1GJdEl1iaiUeqFQ7TMy9kBARsIJxIN5yIVK29octNw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1765502309;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=e/cEI7EOH824SWxyXgvqDg5xmc4eBhX6iWMr8sE3QN8=;
	b=qhXVNWjDZYhzgvCyd7SEyu6ldCCI+GiujWXLEsmSuN3fROpTIPOcmsI1vUgxKuKFN4fwTC
	dD12QOKpXhDDBuCA==
To: Tianyang Zhang <zhangtianyang@loongson.cn>, chenhuacai@kernel.org,
 kernel@xen0n.name, corbet@lwn.net, alexs@kernel.org, si.yanteng@linux.dev,
 jiaxun.yang@flygoat.com, peterz@infradead.org, wangliupu@loongson.cn,
 lvjianmin@loongson.cn, maobibo@loongson.cn, siyanteng@cqsoftware.com.cn,
 gaosong@loongson.cn, yangtiezhu@loongson.cn
Cc: loongarch@lists.linux.dev, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Tianyang Zhang <zhangtianyang@loongson.cn>
Subject: Re: [PATCH v8 5/5] irqchip/irq-loongarch-ir:Add Redirect irqchip
 support
In-Reply-To: <20251211092317.5210-1-zhangtianyang@loongson.cn>
References: <20251211092317.5210-1-zhangtianyang@loongson.cn>
Date: Fri, 12 Dec 2025 10:18:25 +0900
Message-ID: <87tsxwebvi.ffs@tglx>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, Dec 11 2025 at 17:23, Tianyang Zhang wrote:

I've got this twice and still do not have a complete patch series in my
inbox. Can you please fix your mail setup so that the full series
reaches the mailing list?

Thanks,

        tglx
