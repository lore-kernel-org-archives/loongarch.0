Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.166
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792573518;
	b=xajP/3ndc3WwVWRK2cwgeHsQrj7dxPJAmhqKTg78nTBkI90t4My46l+46Yos0PTr2+zo
	 NRSD+zbCYBfYZjZ045GjYUk0ELA6QSgPwM02bKvcrd+OamJtdUBZ642ZNclG36HxXSE3/
	 krJsMkSkkGlR9cNnncxwcBA9GvLXhIfXH6gu8BJMg335o3WP0QqIlQKQbSFUADvjFP9S5
	 +qkjKlLzdOS4Qj3/9TLkbudI8NxaVDMhOk7Qw2yMiqHSXHbND7LTn6+TohRhx6SAYsC+E
	 85U+hLQ/IZx9YUpyFVTeyuiivoYHjz4u6uX+/dqxMHKp8ix0UV/7Y3tPBiN3gaxREFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792573518;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=MRj/0ZsccK00DolFj3Fm4yZKaaBnWZ8Xevvb56if4O8=;
	b=AsnG66o/1ToDiRakNZDpxPrAPicV7HCeqO3VWv4UYPimU1iGAb6aoJDfuiXgS7HIOYik
	 nTIxIG+OtgAtTd1YrHyWEQu4hYQuuyHBYksqo8MGLLLuzKugXzXwS8kTzQ2+bNMWXw8o4
	 9M2VW78wXl+d5fegd9mwJg9B3wB8gIEYb5cFlwaXTno3dkQLpH9tXkUbcEL3BYv+RkJ+0
	 eiOdQQ9tKrNRBd2nYBs/GflmJ82tx8h66DeVj5WOqj6Y0DFCHGrRX0nsn3qcppA/ROi6S
	 qhVaoCpiYIFgEFObYFVFUG+4V7H0p2bnRCjM6tOr01v0lMtYgQObZ+WaNSfmTYd/n2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	dkim=pass header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=geCBf1w1;
	arc=none smtp.remote-ip=185.70.43.166
Received: from mail-43166.protonmail.ch (mail-43166.protonmail.ch [185.70.43.166])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EF08606A321
	for <loongarch@lists.linux.dev>; Wed, 21 Oct 2026 09:05:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8EF08606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=geCBf1w1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1792573515; x=1792832715;
	bh=MRj/0ZsccK00DolFj3Fm4yZKaaBnWZ8Xevvb56if4O8=;
	h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=geCBf1w1Wq7acvnjd8A0a5GPwOUcK8Y+lvFdVONgOi6g4fYvMBOqtYf0Gy6c0eQDx
	 iS27t5EKpSCv8BDvWqEKlHgU7/kjenUc4xTzWKSK7E41kjIZnPC+CZUj81yu0J2kc4
	 C2bZcQ6qNcHjis8LB6jp0LhSoLtP+55QNSxN3Wbku1WpS7CpvZ+idlZO9pK0hRKzsp
	 ScF9Qx6pGzCRdOQHhL61UldegCHkieA1coPxd3pQuIrI6gPM8e8VUlJMp+Qa5Uq4KZ
	 yoho8/EN2U8o4DDOZD0BvNDb3jucmIxt7T0KYh+KYci6wwbIx9gcnuJjCDLc2aZ+xz
	 5EOfTHzlAbYrQ==
Date: Wed, 21 Oct 2026 09:05:12 +0000
To: "loongarch@lists.linux.dev" <loongarch@lists.linux.dev>
From: soffialanotte <soffialanotte@proton.me>
Subject: How can I get started with loongson?
Message-ID: <nIF7OzD8u33FHJ3qE1qFaK7jIfY6eOxk3R7imk_36Akc-o0DTFbXgpOe0Svpcw0Mi_Usx8t_WXLc8j3VjwJCVbLeXmCba5YxdiNsk7dkHWI=@proton.me>
Feedback-ID: 192581689:user:proton
X-Pm-Message-ID: 36140a7e73eca0aebadacce869dd73681cf779cd
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi, everyone.

This is a quick question. It may be inappropriate, and apologies
for remaining anonymous.

I just became an employee of the loongson for a while. My business
unit is not related to upstream Linux directly. Before joining the
company, I had been a Linux amateur who contributed to the upstream
for other platforms. Since I can access to the loongson hardwares
easily now, may I ask how can I get started with loongson upstream?
Open documents, schematic diagrams, datasheets, web pages accessbile
only internally, etc. All of them are welcome.

With best regards,
An anonymous

