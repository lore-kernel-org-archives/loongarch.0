Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27FF93358AE
	for <loongarch@lists.linux.dev>; Mon, 15 Dec 2025 15:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765812874; cv=none; b=IPYh5RsxgKMrsAGwW+lu3RZ+CEvFDRqSUzNt9R/YOCvu0qZJAK0S4dYr7FVlfMaI+pYswtJPFUfPccZwbeiV46UsPoPXddsOg5aWCXyx/Rzjaq6OssUdBeM6TnP6jpk8dVEHPiGyAM2JUDBFLuAGUbpDCcu2xA4z1+gmxYcQaPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765812874; c=relaxed/simple;
	bh=6mcqi0t11lDbGbdYjLvQGUCFj03vrOZDiW1bccX/Ht0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Q4MzmasLrVUrTNd74ho89hiodYnCk6gqulKlcEfhPUX6WXUZH/ChTemD+kRO1BAhsE9Z1vKLq7i8K1bdXImcckotnUtbY7yr9SnRceeWnbxL8seOpE5idt0EXZBpaQlDtPgr2IEl2MtwKEcCrTjBwhKC+Ii2UaqUjsvbQpVBEvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Q/ZJRpNa; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=3Urpfkig; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Q/ZJRpNa";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="3Urpfkig"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1765812868;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6mcqi0t11lDbGbdYjLvQGUCFj03vrOZDiW1bccX/Ht0=;
	b=Q/ZJRpNacj/OS2rFIE1atKIEhuiQZMp9bQnDXPYnZtoKFKfNhycMxS7mR5qRztOOaNBA0p
	FCYnTdhaU06TiJvvveJdCNebTZ9ceHbqC4NGa4gsFIWPy+Y5PDStFPzofqsG2sdCJxu1fh
	v0lCXD3oxMjDsO27OLU8xTTx8Z0ApR0J73FKUHmBq+1EK0kJwVvCR5o7QLdXQ87eo4n+Kp
	+4jLsgK7heBFescra9wxRxw/dhsNCuyeYKKbOeH/lyqnEGThtdWWlujslLaQs68B2p/ksy
	KtOjcdEh6cdSH3hvOTXfzMBqB3MbKSaQowvLPFCH/AziQ2b9bM+g5YAhb/eEyg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1765812868;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6mcqi0t11lDbGbdYjLvQGUCFj03vrOZDiW1bccX/Ht0=;
	b=3UrpfkigXFWRDAMfkUoesJG10bjHB4DyHpJiE2hDLwCSEyYb7LaYq4iQ0cBDJDjDgOw4kW
	9U64RzSmCJgVbgBw==
To: Song Gao <gaosong@loongson.cn>, maobibo@loongson.cn, chenhuacai@kernel.org
Cc: kvm@vger.kernel.org, loongarch@lists.linux.dev, kernel@xen0n.name,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] LongArch: KVM: Add some maccros for AVEC
In-Reply-To: <20251128091125.2720148-2-gaosong@loongson.cn>
References: <20251128091125.2720148-1-gaosong@loongson.cn>
 <20251128091125.2720148-2-gaosong@loongson.cn>
Date: Mon, 15 Dec 2025 16:34:27 +0100
Message-ID: <875xa7ep30.ffs@tglx>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, Nov 28 2025 at 17:11, Song Gao wrote:

> Add some maccros for AVEC interrupt controller, so the dintc can use
> those maccros.

/maccros/macros/

Also your change log fails to mention that this updates the AVEC
driver, which is a nice change but unrelated to $subject.
