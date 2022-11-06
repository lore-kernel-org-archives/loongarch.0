Received: from jari.cn (unknown [218.92.28.115])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85C7D185F
	for <loongarch@lists.linux.dev>; Sun,  6 Nov 2022 10:32:40 +0000 (UTC)
Received: by ajax-webmail-localhost.localdomain (Coremail) ; Sun, 6 Nov 2022
 18:26:38 +0800 (GMT+08:00)
X-Originating-IP: [182.148.13.29]
Date: Sun, 6 Nov 2022 18:26:38 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: wangkailong@jari.cn
To: chenhuacai@kernel.org, kernel@xen0n.name, zhangqing@loongson.cn
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] LoongArch: Fix unsigned comparison with less than zero
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT6.0.1 build 20210329(c53f3fee)
 Copyright (c) 2002-2022 www.mailtech.cn
 mispb-4e503810-ca60-4ec8-a188-7102c18937cf-zhkzyfz.cn
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-ID: <63425a0e.b8.1844c7a5d80.Coremail.wangkailong@jari.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:AQAAfwD3C+Lei2djsoYBAA--.50W
X-CM-SenderInfo: 5zdqwypdlo00nj6mt2flof0/1tbiAQATB2FEYx0CNQAEs9
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
	CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
	daVFxhVjvjDU=

RWxpbWluYXRlIHRoZSBmb2xsb3dpbmcgY29jY2ljaGVjayB3YXJuaW5nOgoKLi9hcmNoL2xvb25n
YXJjaC9rZXJuZWwvdW53aW5kX3Byb2xvZ3VlLmM6ODQ6NS0xMzogV0FSTklORzogVW5zaWduZWQK
ZXhwcmVzc2lvbiBjb21wYXJlZCB3aXRoIHplcm86IGZyYW1lX3JhIDwgMAoKU2lnbmVkLW9mZi1i
eTogS2FpTG9uZyBXYW5nIDx3YW5na2FpbG9uZ0BqYXJpLmNuPgotLS0KIGFyY2gvbG9vbmdhcmNo
L2tlcm5lbC91bndpbmRfcHJvbG9ndWUuYyB8IDMgKystCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNl
cnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9sb29uZ2FyY2gva2Vy
bmVsL3Vud2luZF9wcm9sb2d1ZS5jIGIvYXJjaC9sb29uZ2FyY2gva2VybmVsL3Vud2luZF9wcm9s
b2d1ZS5jCmluZGV4IGIyMDZkOTE1OTIwNS4uNThjY2RiZTdmYTIyIDEwMDY0NAotLS0gYS9hcmNo
L2xvb25nYXJjaC9rZXJuZWwvdW53aW5kX3Byb2xvZ3VlLmMKKysrIGIvYXJjaC9sb29uZ2FyY2gv
a2VybmVsL3Vud2luZF9wcm9sb2d1ZS5jCkBAIC00Myw3ICs0Myw4IEBAIHN0YXRpYyBib29sIHVu
d2luZF9ieV9wcm9sb2d1ZShzdHJ1Y3QgdW53aW5kX3N0YXRlICpzdGF0ZSkKIHsKIAlzdHJ1Y3Qg
c3RhY2tfaW5mbyAqaW5mbyA9ICZzdGF0ZS0+c3RhY2tfaW5mbzsKIAl1bmlvbiBsb29uZ2FyY2hf
aW5zdHJ1Y3Rpb24gKmlwLCAqaXBfZW5kOwotCXVuc2lnbmVkIGxvbmcgZnJhbWVfc2l6ZSA9IDAs
IGZyYW1lX3JhID0gLTE7CisJdW5zaWduZWQgbG9uZyBmcmFtZV9zaXplID0gMDsKKwlsb25nIGZy
YW1lX3JhID0gLTE7CiAJdW5zaWduZWQgbG9uZyBzaXplLCBvZmZzZXQsIHBjID0gc3RhdGUtPnBj
OwogCiAJaWYgKHN0YXRlLT5zcCA+PSBpbmZvLT5lbmQgfHwgc3RhdGUtPnNwIDwgaW5mby0+YmVn
aW4pCi0tIAoyLjI1LjEK
