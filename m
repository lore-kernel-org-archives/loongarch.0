Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [63.216.63.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5978C17583
	for <loongarch@lists.linux.dev>; Wed, 26 Mar 2025 01:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.216.63.40
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742953465; cv=none; b=M0i1u6ohDcEX4cwt7r7HbDL6BUvDSxffoRjLTbbCfKYw0eeCGjpcssZ2rPtWhsxbeKivRJ69SyIIn5rNuEBONQlrVm4jIn9SgmwUFiL4CIoirNyFa9AIzF3437KCjV3CzJImcz88wZuPkJsbqR55vHIUR4WbzpEPISCSKLyjQ4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742953465; c=relaxed/simple;
	bh=GMnhNsSJVZdZ4jNyqsscLOc+TQdAsMSw5uyLlmi2W6A=;
	h=Date:Message-ID:In-Reply-To:References:Mime-Version:From:To:Cc:
	 Subject:Content-Type; b=V+ro57+HMPgghdaTYU6p+PLk30Rk02xyC/hM2j/kK3VQeeUrH1xiTTXJgkvn15ElHxCfs5iQlIl+XKgtkb56SRNafDSdnRXDzs9W/FGhafTmKn4CP0rWkOdqo+6OLc+fC06TU7kVePnpYraULvvBd9gFqGxYywFJjG+cyyUGRKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=63.216.63.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4ZMqMj3phLz8QrkZ;
	Wed, 26 Mar 2025 09:44:17 +0800 (CST)
Received: from xaxapp04.zte.com.cn ([10.99.98.157])
	by mse-fl1.zte.com.cn with SMTP id 52Q1i4PC086739;
	Wed, 26 Mar 2025 09:44:04 +0800 (+08)
	(envelope-from ye.xingchen@zte.com.cn)
Received: from mapi (xaxapp05[null])
	by mapi (Zmail) with MAPI id mid31;
	Wed, 26 Mar 2025 09:44:05 +0800 (CST)
Date: Wed, 26 Mar 2025 09:44:05 +0800 (CST)
X-Zmail-TransId: 2afc67e35be55b2-ae216
X-Mailer: Zmail v1.0
Message-ID: <20250326094405353ipJ7AEI8eo8UowlTrZWDh@zte.com.cn>
In-Reply-To: <2d9bef01f7cf43d1456d9b0d19715a3b7d0fe234.camel@xry111.site>
References: 20250325190844051uFjo0CxrlPVQEpKrtPO_0@zte.com.cn,2d9bef01f7cf43d1456d9b0d19715a3b7d0fe234.camel@xry111.site
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
From: <ye.xingchen@zte.com.cn>
To: <xry111@xry111.site>
Cc: <chenhuacai@kernel.org>, <kernel@xen0n.name>, <loongarch@lists.linux.dev>
Subject: =?UTF-8?B?UmU6IFtQQVRDSCBsb29uZ2FyY2gtbmV4dF0gTG9vbmdBcmNoOiBtYWtlIHhvcl90ZW1wbGF0ZS5jIGluY2x1ZGUgb25jZQ==?=
Content-Type: multipart/mixed;
	boundary="=====_001_next====="
X-MAIL:mse-fl1.zte.com.cn 52Q1i4PC086739
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 67E35BF1.001/4ZMqMj3phLz8QrkZ



--=====_001_next=====
Content-Type: multipart/related;
	boundary="=====_002_next====="


--=====_002_next=====
Content-Type: multipart/alternative;
	boundary="=====_003_next====="


--=====_003_next=====
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: base64

RGVhciBNci4gWGksDQpUaGFuayB5b3UgZm9yIHBvaW50aW5nIG91dCB0aGUgY29tcGlsYXRpb24g
aXNzdWVzIGNhdXNlZCBieSBteSBwYXRjaC4gSSBzaW5jZXJlbHkgYXBvbG9naXplIGZvciBpbnRy
b2R1Y2luZyB0aGVzZSBlcnJvcnMgZHVlIHRvIGluc3VmZmljaWVudCBjb21waWxlLXRlc3Rpbmcg
b2YgdGhlIGNoYW5nZXMuDQpVcG9uIHJldmlld2luZyB0aGUgY29tcGlsZXIgb3V0cHV0LCBJIHJl
YWxpemUgdGhlIGR1cGxpY2F0ZSBpbmNsdXNpb24gb2YgeG9yX3RlbXBsYXRlLmMgY29tYmluZWQg
d2l0aCBtYWNybyB1c2FnZSBjb25mbGljdHMgd2FzIGFuIG92ZXJzaWdodCBvbiBteSBwYXJ0LiBJ
IHNob3VsZCBoYXZlIHBlcmZvcm1lZCBtb3JlIHJpZ29yb3VzIHRlc3RpbmcgYW5kIHZlcmlmaWNh
dGlvbiBiZWZvcmUgc3VibWl0dGluZyB0aGUgcGF0Y2guDQpUaGFuayB5b3UgZm9yIHlvdXIgcGF0
aWVuY2UgYW5kIG1lbnRvcnNoaXAuDQpCZXN0IHJlZ2FyZHMsDQpZZQ==


--=====_003_next=====
Content-Type: text/html ;
	charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBjbGFzcz0iemNvbnRlbnRSb3ciPjxwIHN0eWxlPSJtYXJnaW46IGNhbGModmFyKC0tZHMt
bWQtem9vbSkqMTJweCkwOyBmb250LXNpemU6IDE2LjAwMnB4OyBsaW5lLWhlaWdodDogdmFyKC0t
ZHMtbWQtbGluZS1oZWlnaHQpOyBjb2xvcjogcmdiKDY0LCA2NCwgNjQpOyBmb250LWZhbWlseTog
SW50ZXIsIHN5c3RlbS11aSwgLWFwcGxlLXN5c3RlbSwgQmxpbmtNYWNTeXN0ZW1Gb250LCAmcXVv
dDtTZWdvZSBVSSZxdW90OywgUm9ib3RvLCAmcXVvdDtOb3RvIFNhbnMmcXVvdDssIFVidW50dSwg
Q2FudGFyZWxsLCAmcXVvdDtIZWx2ZXRpY2EgTmV1ZSZxdW90OywgT3h5Z2VuLCAmcXVvdDtPcGVu
IFNhbnMmcXVvdDssIHNhbnMtc2VyaWY7IHdoaXRlLXNwYWNlOiBub3JtYWw7Ij5EZWFyIE1yLiBY
aSw8L3A+PHAgc3R5bGU9Im1hcmdpbjogY2FsYyh2YXIoLS1kcy1tZC16b29tKSoxMnB4KTA7IGZv
bnQtc2l6ZTogMTYuMDAycHg7IGxpbmUtaGVpZ2h0OiB2YXIoLS1kcy1tZC1saW5lLWhlaWdodCk7
IGNvbG9yOiByZ2IoNjQsIDY0LCA2NCk7IGZvbnQtZmFtaWx5OiBJbnRlciwgc3lzdGVtLXVpLCAt
YXBwbGUtc3lzdGVtLCBCbGlua01hY1N5c3RlbUZvbnQsICZxdW90O1NlZ29lIFVJJnF1b3Q7LCBS
b2JvdG8sICZxdW90O05vdG8gU2FucyZxdW90OywgVWJ1bnR1LCBDYW50YXJlbGwsICZxdW90O0hl
bHZldGljYSBOZXVlJnF1b3Q7LCBPeHlnZW4sICZxdW90O09wZW4gU2FucyZxdW90Oywgc2Fucy1z
ZXJpZjsgd2hpdGUtc3BhY2U6IG5vcm1hbDsiPlRoYW5rIHlvdSBmb3IgcG9pbnRpbmcgb3V0IHRo
ZSBjb21waWxhdGlvbiBpc3N1ZXMgY2F1c2VkIGJ5IG15IHBhdGNoLiBJIHNpbmNlcmVseSBhcG9s
b2dpemUgZm9yIGludHJvZHVjaW5nIHRoZXNlIGVycm9ycyBkdWUgdG8gaW5zdWZmaWNpZW50IGNv
bXBpbGUtdGVzdGluZyBvZiB0aGUgY2hhbmdlcy48L3A+PHAgc3R5bGU9Im1hcmdpbjogY2FsYyh2
YXIoLS1kcy1tZC16b29tKSoxMnB4KTA7IGZvbnQtc2l6ZTogMTYuMDAycHg7IGxpbmUtaGVpZ2h0
OiB2YXIoLS1kcy1tZC1saW5lLWhlaWdodCk7IGNvbG9yOiByZ2IoNjQsIDY0LCA2NCk7IGZvbnQt
ZmFtaWx5OiBJbnRlciwgc3lzdGVtLXVpLCAtYXBwbGUtc3lzdGVtLCBCbGlua01hY1N5c3RlbUZv
bnQsICZxdW90O1NlZ29lIFVJJnF1b3Q7LCBSb2JvdG8sICZxdW90O05vdG8gU2FucyZxdW90Oywg
VWJ1bnR1LCBDYW50YXJlbGwsICZxdW90O0hlbHZldGljYSBOZXVlJnF1b3Q7LCBPeHlnZW4sICZx
dW90O09wZW4gU2FucyZxdW90Oywgc2Fucy1zZXJpZjsgd2hpdGUtc3BhY2U6IG5vcm1hbDsiPlVw
b24gcmV2aWV3aW5nIHRoZSBjb21waWxlciBvdXRwdXQsIEkgcmVhbGl6ZSB0aGUgZHVwbGljYXRl
IGluY2x1c2lvbiBvZiB4b3JfdGVtcGxhdGUuYyBjb21iaW5lZCB3aXRoIG1hY3JvIHVzYWdlIGNv
bmZsaWN0cyB3YXMgYW4gb3ZlcnNpZ2h0IG9uIG15IHBhcnQuIEkgc2hvdWxkIGhhdmUgcGVyZm9y
bWVkIG1vcmUgcmlnb3JvdXMgdGVzdGluZyBhbmQgdmVyaWZpY2F0aW9uIGJlZm9yZSBzdWJtaXR0
aW5nIHRoZSBwYXRjaC48L3A+PHAgc3R5bGU9Im1hcmdpbjogY2FsYyh2YXIoLS1kcy1tZC16b29t
KSoxMnB4KTA7IGZvbnQtc2l6ZTogMTYuMDAycHg7IGxpbmUtaGVpZ2h0OiB2YXIoLS1kcy1tZC1s
aW5lLWhlaWdodCk7IGNvbG9yOiByZ2IoNjQsIDY0LCA2NCk7IGZvbnQtZmFtaWx5OiBJbnRlciwg
c3lzdGVtLXVpLCAtYXBwbGUtc3lzdGVtLCBCbGlua01hY1N5c3RlbUZvbnQsICZxdW90O1NlZ29l
IFVJJnF1b3Q7LCBSb2JvdG8sICZxdW90O05vdG8gU2FucyZxdW90OywgVWJ1bnR1LCBDYW50YXJl
bGwsICZxdW90O0hlbHZldGljYSBOZXVlJnF1b3Q7LCBPeHlnZW4sICZxdW90O09wZW4gU2FucyZx
dW90Oywgc2Fucy1zZXJpZjsgd2hpdGUtc3BhY2U6IG5vcm1hbDsiPlRoYW5rIHlvdSBmb3IgeW91
ciBwYXRpZW5jZSBhbmQgbWVudG9yc2hpcC48L3A+PHAgc3R5bGU9ImZvbnQtc2l6ZTogMTYuMDAy
cHg7IGxpbmUtaGVpZ2h0OiB2YXIoLS1kcy1tZC1saW5lLWhlaWdodCk7IGNvbG9yOiByZ2IoNjQs
IDY0LCA2NCk7IGZvbnQtZmFtaWx5OiBJbnRlciwgc3lzdGVtLXVpLCAtYXBwbGUtc3lzdGVtLCBC
bGlua01hY1N5c3RlbUZvbnQsICZxdW90O1NlZ29lIFVJJnF1b3Q7LCBSb2JvdG8sICZxdW90O05v
dG8gU2FucyZxdW90OywgVWJ1bnR1LCBDYW50YXJlbGwsICZxdW90O0hlbHZldGljYSBOZXVlJnF1
b3Q7LCBPeHlnZW4sICZxdW90O09wZW4gU2FucyZxdW90Oywgc2Fucy1zZXJpZjsgd2hpdGUtc3Bh
Y2U6IG5vcm1hbDsgbWFyZ2luLWJvdHRvbTogMHB4ICFpbXBvcnRhbnQ7Ij5CZXN0IHJlZ2FyZHMs
PGJyPlllPC9wPjxwIHN0eWxlPSJmb250LXNpemU6MTRweDtmb250LWZhbWlseTrlvq7ova/pm4Xp
u5EsTWljcm9zb2Z0IFlhSGVpOyI+PGJyPjwvcD48cCBzdHlsZT0iZm9udC1zaXplOjE0cHg7Zm9u
dC1mYW1pbHk65b6u6L2v6ZuF6buRLE1pY3Jvc29mdCBZYUhlaTsiPjxicj48L3A+PHAgc3R5bGU9
ImZvbnQtc2l6ZToxNHB4O2ZvbnQtZmFtaWx5OuW+rui9r+mbhem7kSxNaWNyb3NvZnQgWWFIZWk7
Ij48YnI+PC9wPjxwIHN0eWxlPSJmb250LXNpemU6MTRweDtmb250LWZhbWlseTrlvq7ova/pm4Xp
u5EsTWljcm9zb2Z0IFlhSGVpOyI+PGJyPjwvcD48cD48YnI+PC9wPjwvZGl2Pg==


--=====_003_next=====--

--=====_002_next=====--

--=====_001_next=====--

