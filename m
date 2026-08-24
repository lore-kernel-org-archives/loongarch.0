Received: from smtpbguseast3.qq.com (smtpbguseast3.qq.com [54.243.244.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAF284014BB
	for <loongarch@lists.linux.dev>; Mon, 24 Aug 2026 09:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.243.244.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787565166; cv=none; b=eeOewKIRRliWV1nrioh6NstNS83EC4ArELDsXN1oPDEmRCM9UcGFRBe4wOb2s8iT5l6jRp3LK/fdIy+p/CyKqy2XI1kA0vi3WukHkqrIJx9+zvF7GlmkbXAHlxllcGekKiBoSHkxegabV5+HM/U/SXeTDSCBRyd/xH4z/yl6+0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787565166; c=relaxed/simple;
	bh=4T2SeEcNM3Fvs5U2ae3/QSwrqKwMqIhFhY3byRuBJVo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qn4P5lMJI2I23jOw9FutfbKjAjRxvb0R2rFlChgkbpmbvOzwjUe5L9LwTtIxduY4IFRyrSvWIijA2J3lpXGWSdV47oLEl6QBjJFVugpL1jNu2vRxOkJ+FnaPaxp3INiSRs8E2NPUSoXJt3eEaYkN0KFvWa9dhqCIJWHo7JydJlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=lTKcTwKX; arc=none smtp.client-ip=54.243.244.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="lTKcTwKX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1787565139;
	bh=4T2SeEcNM3Fvs5U2ae3/QSwrqKwMqIhFhY3byRuBJVo=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=lTKcTwKXvlSBvITQHH3PuBbz3Ub35ZVC8wWpr+knCmOazUwKpxRWXbcnhdm19T8a1
	 7xiX076OEZV1ARLYJBpKaJA+Bo91GIkJ+PXejm+HlqlrKQiBCETILuBEqOZWLBvLKN
	 XIRsljjtfLdwg5XQrZu5mp0dEttWUk7owyHarRx0=
X-QQ-mid: zesmtpgz7t1787565122t09f55251
X-QQ-Originating-IP: DbrU3YsBaS1OmWF6eJI78a5enNSNcwdR6bL+gG42KOs=
Received: from localhost.localdomain ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 24 Aug 2026 17:52:00 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 2256383791830669490
EX-QQ-RecipientCnt: 7
From: Wentao Guan <guanwentao@uniontech.com>
To: chenhuacai@kernel.org
Cc: guanwentao@uniontech.com,
	kernel@xen0n.name,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	stable@vger.kernel.org,
	yangtiezhu@loongson.cn
Subject: Re: [PATCH v2] LoongArch: rethook: Do not restore percpu base register in trampoline
Date: Mon, 24 Aug 2026 17:51:59 +0800
Message-Id: <20260824095159.3822966-1-guanwentao@uniontech.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <CAAhV-H7dO4V_McOvX-KyPXEwGHvu8n1inMcdVFyKLof7_Qfh3A@mail.gmail.com>
References: <CAAhV-H7dO4V_McOvX-KyPXEwGHvu8n1inMcdVFyKLof7_Qfh3A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: M7cmwSx0OcrMNn2nhWqpS3yT8tpxb1jGTQK/3/rfmUkm4CPtyREpCK9a
	wE3kcmoWb4w7FFHWYl9yV+BVo1nMgcWUNyeZXLjLRKgP9YMJuMy221bpbYzEedEix8Dexxw
	3PqWvimEyAHwJdW0caPbx96QTpmO7Ei46O1B1GeV5wiuc7IqL8Dgfqe6iMByKUhn+Okjj5Y
	nRWWAEnKE+UFlOFEzY8rznzfwFRTe3JQrca8xdePdAqU7YHZi4x8LIhohDEfPib/V4he2ra
	jUtyIQV+hz7zPOSMjIqK85Kv4wMdYHoVAadbKD79h6dfuTmbENp5RNgmMTH/caR8x8lYFmK
	7j4Uzusfj8O1KTMOM36h+6VFzoL43zLsy7ckKItOMK5seV+byYJxMV0hQrKNwLqvfTdMV2r
	4sFI48lAbkghcaHs5UZrlxTJSYOTFtQ0/r18vioxGOqPnllpZpvEDPI5jLAD6BU5TrKIbOO
	NzqQY02f01Ob/QLwqWwGbI82q695Lyf0Gat4hS82lXgTD4VZsqkgVUIeVJPESIQJEc6tEh4
	hX7sHJO8cLpUDm+HCfSbJvfhAOYFl00o4U5GfymYl0YdKdJ/tOXr07m1mb7RLcJJFUi9jr4
	XyMGSQinrgBLqyt/rLe4Em7yYFrIuBD2Vw6Tzhn01SuBgzLMrPGOmsnON9fi2r4KWlNHI/K
	5TqfC4RJ5TqTj/etnxjDtJmd7Ym1ROHUSa/Dclz/uKzUlTzgwl2AT+QoSiEuPJMSF+6JXv/
	VksWaJJyQfOHvRJeZ70VKNGGkRPytKUsFZv6NMzDv74Hc4XbfQsHFtq8CmVZC+fHS07KR3Q
	q5XlgY/meVBWuA/+yu5zrSrDL5BwIhYmAlBtxCRFJ7MVebXmJ3t2c1n/4gWHmtZe8RF3siG
	DGjLLHPtOFKuw9inkO/aV2XTQzl9u7FkOJVWKCf66OGdcdxFaBLAujGGlMZZsASj0bN0OuX
	HYYYOS8I/PPBhPSnSLvBnPkUW+OWLfEiZbANBjuoeUY2xP4B+nSmFmvNJ8qswPFm2Y2i28a
	WG+PYsl6+91Rqx21zYFlImyDLfCYEyJ7DcZfdQS4gvgvQdnfmMYDWpJqMxfzzbc9xyAo6Od
	fWqC/7OdDIykX+G6NDf3Sxjob43lSWfTGtY3ROkkGRUH33iXE7ufO5N3mZ9zgntuA==
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
X-QQ-RECHKSPAM: 0

> > ---
> > changelog v2:
> > according sashiko report, keep cfi_st u0, PT_R21
> > Link: https://sashiko.dev/#/patchset/20260824082524.3801394-1-guanwentao%40uniontech.com
> I don't think AI is correct here, if "leaking" a random stack value is
> unacceptable, then "leaking" $r21 is better?

Right, in the place are secret to unprivileged users, so delete the pair is tidy.

BRs
Wentao Guan
