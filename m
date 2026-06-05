Received: from relay0-bqueue-c.mailbaby.net (relay0-bqueue-c.mailbaby.net [68.168.210.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33F5948BD56
	for <loongarch@lists.linux.dev>; Fri,  5 Jun 2026 08:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.168.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780646601; cv=none; b=dCbSyfkpN855umnhV/VKxcGICQF6ZcFcTo1EkZ18NGQfF2BTfVpOKMwNsBhuUFxAE1S9/AcNk/VnP8zp9y6uPbykGgMMLJxZFMNPRsoCBde4qn5npMeAbUpseyMjiZNEoED/iVmL75V3e0mdNO2kOPPjGpODvLiW4HeZuGWZzok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780646601; c=relaxed/simple;
	bh=X0io6JTVrv6uVlzin2aWfgk7nIYeP7EIf/6roE/0TJY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z0LgxHzD3cnARthIgMS1HqeFpre0msmSMKmNauRxlbH0XtgF1qG3elNtY9luRkoD6/fm19jWuXB/PTTJH3r4cLniNrPNLb1m1LyN6xeN8uRACkgJAc4TZbDgNuyXwaapfaWHN/fGnmTcQMqIsyDi6nqA8UWKo5ZespTd1nqg3LU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aosc.io; spf=pass smtp.mailfrom=aosc.io; dkim=pass (1024-bit key) header.d=mailbaby.net header.i=@mailbaby.net header.b=BMexWQLp; dkim=pass (1024-bit key) header.d=aosc.io header.i=@aosc.io header.b=SxRWcOK1; arc=none smtp.client-ip=68.168.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aosc.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aosc.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mailbaby.net header.i=@mailbaby.net header.b="BMexWQLp";
	dkim=pass (1024-bit key) header.d=aosc.io header.i=@aosc.io header.b="SxRWcOK1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbaby.net;
 q=dns/txt; s=key3; bh=X0io6JTVrv6uVlzin2aWfgk7nIYeP7EIf/6roE/0TJY=;
 h=from:subject:date:message-id:to:cc:mime-version:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=BMexWQLpYv+/q6fhWoR1P3nGBcv0fSVNtjzbXxu3VDrs5MO7q6iS+xdY9il548hlqbHI2nbWe
 jh5qZr03Z7vhmKKnUtjwOAgcuBmx4hx8gTG8goi9/+/4VrsO9m/wYbPLhJOGignycb27mVhtcSk
 Vhv+VUmyQ9difl8zroPdmLs=
Received: from mb-nj-kvm1.internal (mb-nj-kvm1.internal [10.10.2.10])
 (Authenticated sender: mb86144)
 by relay0-bqueue-c.mailbaby.net (MailBabyMTA) with ESMTPSA id 19e96c9f994000056b.002
 for <loongarch@lists.linux.dev>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 05 Jun 2026 07:57:59 +0000
X-Zone-Loop: f31e33ef9038bcc0fff784d931b78be48b73f8c66f4a
X-MB-ID: mb86144
X-SPF: pass
Feedback-ID: mb86144:19e96c:587f4d465843594778405947455d:mbaby
X-NS-SCAN: PASS
X-MAILBABY-ORIGIN: PASS
Received: from relay1.mymailcheap.com (relay1.mymailcheap.com [144.217.248.102])
	by relay5.mymailcheap.com (Postfix) with ESMTPS id 41C21200C2;
	Fri,  5 Jun 2026 07:57:51 +0000 (UTC)
Received: from nf1.mymailcheap.com (nf1.mymailcheap.com [51.75.14.91])
	by relay1.mymailcheap.com (Postfix) with ESMTPS id 768453EE8A;
	Fri,  5 Jun 2026 07:57:43 +0000 (UTC)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
	by nf1.mymailcheap.com (Postfix) with ESMTPSA id 9BE97400D5;
	Fri,  5 Jun 2026 07:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=aosc.io; s=default;
	t=1780646262; bh=X0io6JTVrv6uVlzin2aWfgk7nIYeP7EIf/6roE/0TJY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SxRWcOK1jqz7+V09WZfC+6zqsj9XpL+tEfnxyOGBKKLcGbNSiAEJSsg7SvO+Ks7Kb
	 DQEG7F2clipuqr2bTu6ucZlnwHDt8i75R3n3W05ykJX5OwQPm15WP0b5rZPXztN7Cb
	 pm5AmbgPbY+UVEhVezw8imfBDxjkWayCG8085z1E=
Received: from avenger-XINGYAO-Series.tail8e8410.ts.net (unknown [114.246.239.235])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail20.mymailcheap.com (Postfix) with ESMTPSA id 96DE4406E1;
	Fri,  5 Jun 2026 07:57:29 +0000 (UTC)
From: WangYuli <wangyuli@aosc.io>
To: dongtai.guo@linux.dev
Cc: ardb@kernel.org,
	chenhuacai@kernel.org,
	guodongtai@kylinos.cn,
	jiaxun.yang@flygoat.com,
	jikos@kernel.org,
	joe.lawrence@redhat.com,
	jpoimboe@kernel.org,
	kernel@xen0n.name,
	linux-kernel@vger.kernel.org,
	liukexin@kylinos.cn,
	live-patching@vger.kernel.org,
	llvm@lists.linux.dev,
	loongarch@lists.linux.dev,
	mbenes@suse.cz,
	nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com,
	peterz@infradead.org,
	pmladek@suse.com,
	rostedt@goodmis.org,
	xry111@xry111.site,
	yangtiezhu@loongson.cn
Subject: Re: [PATCH 0/8] LoongArch: Add livepatch build (KLP) support
Date: Fri,  5 Jun 2026 15:57:22 +0800
Message-ID: <20260605075722.48712-1-wangyuli@aosc.io>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260604065317.219777-1-dongtai.guo@linux.dev>
References: <20260604065317.219777-1-dongtai.guo@linux.dev>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: nf1.mymailcheap.com
X-Rspamd-Queue-Id: 9BE97400D5
X-Spamd-Result: default: False [2.70 / 10.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.10)[+mx];
	MIME_GOOD(-0.10)[text/plain];
	R_DKIM_ALLOW(-0.10)[aosc.io:s=default];
	TO_DN_NONE(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[lkml];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_ONE(0.00)[1];
	LOCAL_OUTBOUND(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,kylinos.cn,flygoat.com,redhat.com,xen0n.name,vger.kernel.org,lists.linux.dev,suse.cz,gmail.com,infradead.org,suse.com,goodmis.org,xry111.site,loongson.cn];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_TRACE(0.00)[aosc.io:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[aosc.io,quarantine];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[22];
	ALIAS_RESOLVED(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Rspamd-Action: no action

Hi Dongtai,

Patches 1 and 2 should be merged into a single patch and placed at the end of
your patch series rather than at the beginning.

Alternatively, you could simply use patch [1] to replace these two patches, which
might make more sense chronologically.

[1]. https://lore.kernel.org/all/20251203091039.125259-1-wangyuli@aosc.io/

Thanks,
---
WangYuli
